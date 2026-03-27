import 'dart:convert';

import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/models/business_cards/contacts_response.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/core/utils/shared_preferences_manager.dart';
import 'package:digivizit/features/home/viewmodel/home_view_model.dart';
import 'package:digivizit/shared/components/base_design/base_design.dart';
import 'package:digivizit/shared/components/bottom_sheet/custom_bottom_sheet_view.dart';
import 'package:digivizit/shared/components/buttons/button_properties.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class ContactDetailView extends StatefulWidget {
  final ContactsData contact;

  const ContactDetailView({super.key, required this.contact});

  @override
  State<ContactDetailView> createState() => _ContactDetailViewState();
}

class _ContactDetailViewState extends State<ContactDetailView> with SingleTickerProviderStateMixin {
  final HomeViewModel _homeViewModel = HomeViewModel();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isContactInfoExpanded = false;
  bool _isNotesExpanded = false;
  final TextEditingController _noteController = TextEditingController();
  List<ActivityModel> _localNotes = [];
  Color _topColor = const Color(0xFFFFFFFF);
  Color _bottomColor = const Color(0xFFFFFFFF);
  String get _contactNotesKey => 'contact_${widget.contact.id}';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic));

    final savedPersonelInfo = AppSettings.instance.personelInfo;
    if (savedPersonelInfo != null) {
      _homeViewModel.setInitialPersonelInfo(savedPersonelInfo);
    }

    _homeViewModel.loadBackgroundColors(topFallback: _topColor, bottomFallback: _bottomColor).then((gradientColors) {
      if (!mounted) return;

      setState(() {
        _topColor = gradientColors.topColor;
        _bottomColor = gradientColors.bottomColor;
      });
    });

    _animationController.forward();
    _loadLocalNotes();
  }

  Future<void> _loadLocalNotes() async {
    final String? notesJson = AppSettings.instance.sharedPreferencesManager.getString(SharedKeys.contactNotes);
    if (notesJson != null) {
      final Map<String, dynamic> allNotes = jsonDecode(notesJson);
      final List<dynamic>? contactNotes = allNotes[_contactNotesKey];
      if (contactNotes != null) {
        setState(() {
          _localNotes = contactNotes.map((e) => ActivityModel(date: e['date'], description: e['description'])).toList();
        });
      }
    }
  }

  Future<void> _saveLocalNote(String note) async {
    if (note.isEmpty) return;

    final String date = DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now());
    final newLocalNote = ActivityModel(date: date, description: note);

    final String? notesJson = AppSettings.instance.sharedPreferencesManager.getString(SharedKeys.contactNotes);
    Map<String, dynamic> allNotes = {};
    if (notesJson != null) {
      allNotes = jsonDecode(notesJson);
    }

    final List<dynamic> contactNotes = allNotes[_contactNotesKey] ?? [];
    contactNotes.add({'date': date, 'description': note});
    allNotes[_contactNotesKey] = contactNotes;

    await AppSettings.instance.sharedPreferencesManager.saveString(SharedKeys.contactNotes, jsonEncode(allNotes));

    setState(() {
      _localNotes.add(newLocalNote);
      _noteController.clear();
    });
  }

  Future<void> _deleteLocalNote(ActivityModel note) async {
    final String? notesJson = AppSettings.instance.sharedPreferencesManager.getString(SharedKeys.contactNotes);
    if (notesJson == null) return;

    final Map<String, dynamic> allNotes = jsonDecode(notesJson);
    final List<dynamic> contactNotes = allNotes[_contactNotesKey] ?? [];

    contactNotes.removeWhere((e) => e['date'] == note.date && e['description'] == note.description);
    allNotes[_contactNotesKey] = contactNotes;

    await AppSettings.instance.sharedPreferencesManager.saveString(SharedKeys.contactNotes, jsonEncode(allNotes));

    setState(() {
      _localNotes.remove(note);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseDesign(
      topColor: _topColor,
      bottomColor: _bottomColor,
      children: [
        FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FigmaBox(height: 75),
                // Back Button ve Header
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: FigmaContainer(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.baseWhite.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.baseWhite.withValues(alpha: 0.2), width: 1),
                        ),
                        child: Icon(Icons.arrow_back_ios_new, color: AppColors.baseWhite, size: 18),
                      ),
                    ),
                  ],
                ),
                FigmaBox(height: 24),

                // İsim ve Şirket
                Text(widget.contact.name, style: AppFonts.baseBold.copyWith(fontSize: 28, color: AppColors.baseWhite, letterSpacing: -0.5)),
                FigmaBox(height: 8),
                Text(widget.contact.company, style: AppFonts.baseRegular.copyWith(fontSize: 16, color: AppColors.baseWhite.withValues(alpha: 0.7))),
                FigmaBox(height: 16),
                // Scanned Business Card
                /*  _buildBusinessCardSection(),
                FigmaBox(height: 24), */

                // Contact Information
                _buildContactInformation(),
                FigmaBox(height: 24),

                // Notes & Activity
                _buildNotesActivity(),
                FigmaBox(height: 24),

                // Tags & Sector
                _buildTagsSection(),
                FigmaBox(height: 24),

                /*      // Professional Details
                _buildProfessionalDetails(),
                FigmaBox(height: 24), */

                // Action Buttons
                _buildActionButtons(),
                FigmaBox(height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /* Widget _buildBusinessCardSection() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.baseWhite.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.baseWhite.withValues(alpha: 0.1), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Scanned Business Card', style: AppFonts.baseSemibold.copyWith(fontSize: 14, color: AppColors.baseWhite)),
          ),
          Container(
            height: 180,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(image: NetworkImage(widget.contact.businessCardImages[_currentImageIndex]), fit: BoxFit.cover),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.baseWhite.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.baseWhite.withValues(alpha: 0.3), width: 1),
                    ),
                    child: Text('Front', style: AppFonts.baseSemibold.copyWith(fontSize: 12, color: AppColors.baseBlack)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Indicator Dots
          if (widget.contact.businessCardImages.length > 1)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.contact.businessCardImages.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentImageIndex == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentImageIndex == index ? Color(0xFF3B82F6) : AppColors.baseWhite.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  } */

  Widget _buildContactInformation() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isContactInfoExpanded = !_isContactInfoExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: appSizer.paddingAll(20),
        decoration: BoxDecoration(
          color: AppColors.baseWhite.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isContactInfoExpanded ? const Color(0xFF60A5FA).withValues(alpha: 0.3) : AppColors.baseWhite.withValues(alpha: 0.1),
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FigmaContainer(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF60A5FA)),
                ),
                const SizedBox(width: 12),
                Text('Bağlantı Bilgileri', style: AppFonts.baseBold.copyWith(fontSize: 18, color: AppColors.baseWhite)),
                const Spacer(),
                AnimatedRotation(
                  duration: const Duration(milliseconds: 300),
                  turns: _isContactInfoExpanded ? 0.5 : 0,
                  child: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF60A5FA), size: 28),
                ),
              ],
            ),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState: _isContactInfoExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              firstChild: const SizedBox(),
              secondChild: Column(
                children: [
                  FigmaBox(height: 24),
                  // Firma Adı / Ünvan
                  _buildContactInfoItem(
                    icon: Icons.business_center,
                    iconColor: const Color(0xFFF59E0B),
                    label: 'Firma Adı / Ünvan',
                    value: widget.contact.company.isNotEmpty
                        ? '${widget.contact.company}${widget.contact.position.isNotEmpty ? ' · ${widget.contact.position}' : ''}'
                        : widget.contact.position,
                    onTap: () {},
                  ),
                  FigmaBox(height: 12),
                  // İlgili Kişi Adı Soyadı
                  if (widget.contact.contactPerson.isNotEmpty) ...[
                    _buildContactInfoItem(
                      icon: Icons.person,
                      iconColor: const Color(0xFF06B6D4),
                      label: 'İlgili Kişi Adı Soyadı',
                      value: widget.contact.contactPerson,
                      onTap: () {},
                    ),
                    FigmaBox(height: 12),
                  ],
                  // İlgili Kişi Telefon
                  if (widget.contact.contactPhone.isNotEmpty) ...[
                    _buildContactInfoItem(
                      icon: Icons.phone_in_talk,
                      iconColor: const Color(0xFF10B981),
                      label: 'İlgili Kişi Telefon',
                      value: widget.contact.contactPhone,
                      onTap: () => _launchUrl(Uri.parse('tel:${widget.contact.contactPhone}')),
                    ),
                    FigmaBox(height: 12),
                  ],
                  // İlgili Kişi Mail
                  if (widget.contact.contactEmail.isNotEmpty) ...[
                    _buildContactInfoItem(
                      icon: Icons.mark_email_read,
                      iconColor: const Color(0xFF3B82F6),
                      label: 'İlgili Kişi Mail',
                      value: widget.contact.contactEmail,
                      onTap: () => _launchUrl(Uri.parse('mailto:${widget.contact.contactEmail}')),
                    ),
                    FigmaBox(height: 12),
                  ],
                  // Hizmet / Sektör
                  if (widget.contact.sector.isNotEmpty) ...[
                    _buildContactInfoItem(
                      icon: Icons.category,
                      iconColor: const Color(0xFFA855F7),
                      label: 'Hizmet / Sektör',
                      value: widget.contact.sector,
                      onTap: () {},
                    ),
                    FigmaBox(height: 12),
                  ],
                  // Web Sitesi
                  _buildContactInfoItem(
                    icon: Icons.language,
                    iconColor: const Color(0xFF8B5CF6),
                    label: 'Web Sitesi',
                    value: widget.contact.website,
                    onTap: () => _launchUrl(Uri.parse(widget.contact.website)),
                  ),
                  FigmaBox(height: 12),
                  // Firma Email
                  _buildContactInfoItem(
                    icon: Icons.email,
                    iconColor: const Color(0xFF60A5FA),
                    label: 'Firma Email',
                    value: widget.contact.email,
                    onTap: () => _launchUrl(Uri.parse('mailto:${widget.contact.email}')),
                  ),
                  FigmaBox(height: 12),
                  // Firma Telefon
                  _buildContactInfoItem(
                    icon: Icons.phone,
                    iconColor: const Color(0xFF34D399),
                    label: 'Firma Telefon',
                    value: widget.contact.phone,
                    onTap: () => _launchUrl(Uri.parse('tel:${widget.contact.phone}')),
                  ),
                  FigmaBox(height: 12),
                  // Ülke
                  if (widget.contact.country.isNotEmpty) ...[
                    _buildContactInfoItem(icon: Icons.flag, iconColor: const Color(0xFFF97316), label: 'Ülke', value: widget.contact.country, onTap: () {}),
                    FigmaBox(height: 12),
                  ],
                  // Adres
                  _buildContactInfoItem(
                    icon: Icons.location_on,
                    iconColor: const Color(0xFFEC4899),
                    label: 'Adres',
                    value: widget.contact.location,
                    onTap: () {},
                    isMultiline: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfoItem({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required VoidCallback onTap,
    bool isMultiline = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.baseWhite.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.baseWhite.withValues(alpha: 0.1), width: 1),
        ),
        child: Row(
          crossAxisAlignment: isMultiline ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: iconColor.withValues(alpha: 0.3), width: 1),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: AppFonts.baseRegular.copyWith(fontSize: 12, color: AppColors.baseWhite.withValues(alpha: 0.6))),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: AppFonts.baseSemibold.copyWith(fontSize: 14, color: AppColors.baseWhite),
                    maxLines: isMultiline ? 2 : 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotesActivity() {
    /*     final combinedActivities = [...widget.contact.activities, ..._localNotes];
    final bool needsExpansion = combinedActivities.length > 4;
 */
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.baseWhite.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _isNotesExpanded ? const Color(0xFF60A5FA).withValues(alpha: 0.3) : AppColors.baseWhite.withValues(alpha: 0.1), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: _isNotesExpanded
                ? () {
                    setState(() {
                      _isNotesExpanded = !_isNotesExpanded;
                    });
                  }
                : null,
            behavior: HitTestBehavior.opaque,
            child: Row(
              children: [
                FigmaContainer(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF3B82F6)),
                ),
                const SizedBox(width: 12),
                Text('Notlarım', style: AppFonts.baseBold.copyWith(fontSize: 16, color: AppColors.baseWhite)),
                const Spacer(),
                if (_isNotesExpanded)
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 300),
                    turns: _isNotesExpanded ? 0.5 : 0,
                    child: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF3B82F6), size: 24),
                  ),
              ],
            ),
          ),
          FigmaBox(height: 16),

          // Add Note Field (Always Visible)
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _noteController,
                  style: AppFonts.baseRegular.copyWith(color: AppColors.baseWhite, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Add a note...',
                    hintStyle: AppFonts.baseRegular.copyWith(color: AppColors.baseWhite.withValues(alpha: 0.4), fontSize: 14),
                    filled: true,
                    fillColor: AppColors.baseWhite.withValues(alpha: 0.05),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.baseWhite.withValues(alpha: 0.1)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.baseWhite.withValues(alpha: 0.1)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF3B82F6), width: 1.5),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () => _saveLocalNote(_noteController.text),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B82F6),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: const Color(0xFF3B82F6).withValues(alpha: 0.3), blurRadius: 10, offset: const Offset(0, 4))],
                  ),
                  child: const Icon(Icons.add, color: AppColors.baseWhite, size: 24),
                ),
              ),
            ],
          ),
          FigmaBox(height: 20),

          // Activities List (Conditionally Expandable)
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: (_isNotesExpanded) ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            firstChild: Column(
              children: _localNotes.reversed.take(4).map((activity) {
                final bool isLocal = _localNotes.contains(activity);
                final Widget item = _buildActivityItem(activity);
                if (isLocal) {
                  return _wrapWithDismissible(activity, item);
                }
                return item;
              }).toList(),
            ),
            secondChild: Column(
              children: _localNotes.reversed.map((activity) {
                final bool isLocal = _localNotes.contains(activity);
                final Widget item = _buildActivityItem(activity);
                if (isLocal) {
                  return _wrapWithDismissible(activity, item);
                }
                return item;
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _wrapWithDismissible(ActivityModel activity, Widget child) {
    return Dismissible(
      key: ValueKey('${activity.date}_${activity.description}'),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        bool shouldDelete = false;
        await CustomBottomSheet.customView(
          context: context,
          title: 'Notu Sil',
          text: 'Bu notu silmek istediğinizden emin misiniz?',
          hexagonIcon: Icons.delete_outline,
          hexagonColor: AppColors.negative700,
          viewTopBar: true,
          isDismissible: true,
          buttons: [
            ButtonProperties(
              onPressed: () {
                shouldDelete = true;
                Navigator.pop(context);
              },
              text: 'Sil',
              color: AppColors.negative700,
            ),
          ],
          secondaryButtons: [
            ButtonProperties(
              onPressed: () {
                shouldDelete = false;
                Navigator.pop(context);
              },
              text: 'Vazgeç',
              color: AppColors.neutral500,
            ),
          ],
        );
        return shouldDelete;
      },
      onDismissed: (direction) {
        _deleteLocalNote(activity);
      },
      background: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(color: AppColors.negative700.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete_outline, color: AppColors.negative700),
      ),
      child: child,
    );
  }

  Widget _buildActivityItem(ActivityModel activity) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.baseWhite.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.baseWhite.withValues(alpha: 0.1), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Color(0xFF3B82F6).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Color(0xFF3B82F6).withValues(alpha: 0.3), width: 1),
            ),
            child: Icon(Icons.event_note, color: Color(0xFF3B82F6), size: 16),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 12, color: AppColors.baseWhite.withValues(alpha: 0.5)),
                    const SizedBox(width: 4),
                    Text(activity.date, style: AppFonts.baseRegular.copyWith(fontSize: 12, color: AppColors.baseWhite.withValues(alpha: 0.5))),
                  ],
                ),
                const SizedBox(height: 4),
                Text(activity.description, style: AppFonts.baseRegular.copyWith(fontSize: 13, color: AppColors.baseWhite.withValues(alpha: 0.9))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTagsSection() {
    return FigmaContainer(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.baseWhite.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.baseWhite.withValues(alpha: 0.1), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FigmaContainer(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFA855F7)),
              ),
              const SizedBox(width: 12),
              Text('Etiketler & Sektör', style: AppFonts.baseBold.copyWith(fontSize: 16, color: AppColors.baseWhite)),
            ],
          ),
          FigmaBox(height: 16),
          // Sektör chip'i
          if (widget.contact.sector.isNotEmpty) ...[
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FigmaContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFA855F7).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFA855F7).withValues(alpha: 0.4), width: 1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.category, color: Color(0xFFA855F7), size: 14),
                      const SizedBox(width: 6),
                      Text(widget.contact.sector, style: AppFonts.baseBold.copyWith(fontSize: 12, color: const Color(0xFFA855F7))),
                    ],
                  ),
                ),
              ],
            ),
            FigmaBox(height: 12),
          ],
          // Etiketler
          /* if (widget.contact.tags.isNotEmpty)
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                widget.contact.tags.length,
                (index) => FigmaContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: widget.contact.tagColors[index].withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: widget.contact.tagColors[index].withValues(alpha: 0.4), width: 1),
                  ),
                  child: Text(widget.contact.tags[index], style: AppFonts.baseBold.copyWith(fontSize: 12, color: widget.contact.tagColors[index])),
                ),
              ),
            ), */
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onPressWhatsapp,
            child: FigmaContainer(
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.positive500,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.positive500.withValues(alpha: 0.2), width: 1.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.call, color: AppColors.baseWhite, size: 20),
                  const SizedBox(width: 8),
                  Text('WhatsApp', style: AppFonts.baseSemibold.copyWith(fontSize: 15, color: AppColors.baseWhite)),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: GestureDetector(
            onTap: () => _makePhoneCall(widget.contact.contactPhone),
            child: FigmaContainer(
              height: 56,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF2563EB)]),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Color(0xFF3B82F6).withValues(alpha: 0.4), blurRadius: 20, offset: const Offset(0, 8))],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone_callback_sharp, color: AppColors.baseWhite, size: 20),
                  const SizedBox(width: 8),
                  Text('Ara', style: AppFonts.baseBold.copyWith(fontSize: 15, color: AppColors.baseWhite)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> onPressWhatsapp() async {
    final link = WhatsAppUnilink(phoneNumber: widget.contact.contactPhone, text: "");
    await launchUrl(Uri.parse('$link'));
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  Future<void> _launchUrl(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

// Activity Model
class ActivityModel {
  final String date;
  final String description;

  ActivityModel({required this.date, required this.description});

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ActivityModel && runtimeType == other.runtimeType && date == other.date && description == other.description;

  @override
  int get hashCode => date.hashCode ^ description.hashCode;
}

extension ContactsDataDetailFields on ContactsData {
  String get name => nameSurname.isNotEmpty ? nameSurname.first : '';

  String get company => companyName;

  String get position => unvan.isNotEmpty ? unvan.first : '';

  String get contactPerson => nameSurname.length > 1 ? nameSurname.skip(1).join(', ') : '';

  String get contactPhone => phoneList.isNotEmpty ? phoneList.first : '';

  String get contactEmail => emailList.isNotEmpty ? emailList.first : '';

  String get location => address;
}
