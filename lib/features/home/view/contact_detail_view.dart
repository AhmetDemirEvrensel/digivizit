import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/models/business_cards/contacts_response.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/features/home/viewmodel/home_view_model.dart';
import 'package:digivizit/shared/components/base_design/base_design.dart';
import 'package:digivizit/shared/components/bottom_sheet/custom_bottom_sheet_view.dart';
import 'package:digivizit/shared/components/buttons/button_properties.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class ContactDetailView extends StatefulWidget {
  final BusinessCardListItem contact;

  const ContactDetailView({super.key, required this.contact});

  @override
  State<ContactDetailView> createState() => _ContactDetailViewState();
}

class _ContactDetailViewState extends State<ContactDetailView>
    with SingleTickerProviderStateMixin {
  final HomeViewModel _homeViewModel = HomeViewModel();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isContactInfoExpanded = false;
  bool _isNotesExpanded = false;
  final TextEditingController _noteController = TextEditingController();
  Color _topColor = const Color(0xFFFFFFFF);
  Color _bottomColor = const Color(0xFFFFFFFF);
  BusinessCardDetailData? _detail;
  bool _isLoadingDetail = true;
  int _currentImageIndex = 0;
  bool _cardWasChanged = false;

  int get _cardId => widget.contact.id!;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    final savedProfile = AppSettings.instance.profile;
    if (savedProfile != null) {
      _homeViewModel.setInitialProfile(savedProfile);
    }

    _homeViewModel
        .loadBackgroundColors(
          topFallback: _topColor,
          bottomFallback: _bottomColor,
        )
        .then((gradientColors) {
          if (!mounted) return;

          setState(() {
            _topColor = gradientColors.topColor;
            _bottomColor = gradientColors.bottomColor;
          });
        });

    _animationController.forward();
    _loadDetail();
  }

  Future<void> _loadDetail() async {
    setState(() => _isLoadingDetail = true);
    final result = await _homeViewModel.getBusinessCardDetail(_cardId);
    if (!mounted) return;

    if (result.isSuccess && result.data?.data != null) {
      setState(() {
        _detail = result.data!.data;
        _isLoadingDetail = false;
        _currentImageIndex = 0;
      });
    } else {
      setState(() => _isLoadingDetail = false);
      CustomBottomSheet.errorView(
        text: result.error?.message ?? 'Kartvizit detayi alinamadi.',
      );
    }
  }

  Future<void> _saveNote(String note) async {
    final trimmed = note.trim();
    if (trimmed.isEmpty) return;

    final result = await _homeViewModel.addBusinessCardNote(_cardId, trimmed);
    if (!mounted) return;

    if (result.isSuccess) {
      _noteController.clear();
      _cardWasChanged = true;
      await _loadDetail();
    } else {
      CustomBottomSheet.errorView(
        text: result.error?.message ?? 'Not eklenemedi.',
      );
    }
  }

  Future<void> _deleteNote(BusinessCardNote note) async {
    if (note.id == null) return;

    final result = await _homeViewModel.deleteBusinessCardNote(
      _cardId,
      note.id!,
    );
    if (!mounted) return;

    if (result.isSuccess) {
      _cardWasChanged = true;
      await _loadDetail();
    } else {
      CustomBottomSheet.errorView(
        text: result.error?.message ?? 'Not silinemedi.',
      );
    }
  }

  Future<void> _deleteMedia(BusinessCardImage image) async {
    if (image.id == null) return;

    final result = await _homeViewModel.deleteBusinessCardMedia(
      _cardId,
      image.id!,
    );
    if (!mounted) return;

    if (result.isSuccess) {
      _cardWasChanged = true;
      await _loadDetail();
    } else {
      CustomBottomSheet.errorView(
        text: result.error?.message ?? 'Gorsel silinemedi.',
      );
    }
  }

  Future<void> _confirmDeleteCard() async {
    bool shouldDelete = false;
    await CustomBottomSheet.customView(
      context: context,
      title: 'Kartviziti Sil',
      text: 'Bu kartviziti silmek istediginizden emin misiniz?',
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

    if (!shouldDelete || !mounted) return;

    final result = await _homeViewModel.deleteBusinessCard(_cardId);
    if (!mounted) return;

    if (result.isSuccess) {
      Navigator.of(context).pop(true);
    } else {
      CustomBottomSheet.errorView(
        text: result.error?.message ?? 'Kartvizit silinemedi.',
      );
    }
  }

  Future<void> _showEditSheet() async {
    final detail = _detail;
    if (detail == null) return;

    final companyController = TextEditingController(text: detail.companyName);
    final sectorController = TextEditingController(text: detail.sector);
    final phoneController = TextEditingController(text: detail.phone);
    final emailController = TextEditingController(text: detail.email);
    final websiteController = TextEditingController(text: detail.website);
    final addressController = TextEditingController(text: detail.address);

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF111827),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kartviziti Düzenle',
                  style: AppFonts.baseBold.copyWith(
                    fontSize: 18,
                    color: AppColors.baseWhite,
                  ),
                ),
                FigmaBox(height: 16),
                _buildEditField('Firma Adı', companyController),
                FigmaBox(height: 12),
                _buildEditField('Sektör', sectorController),
                FigmaBox(height: 12),
                _buildEditField('Telefon', phoneController),
                FigmaBox(height: 12),
                _buildEditField('E-posta', emailController),
                FigmaBox(height: 12),
                _buildEditField('Website', websiteController),
                FigmaBox(height: 12),
                _buildEditField('Adres', addressController),
                FigmaBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(sheetContext).pop();
                      await _submitEdit(
                        companyName: companyController.text.trim(),
                        sector: sectorController.text.trim(),
                        phone: phoneController.text.trim(),
                        email: emailController.text.trim(),
                        website: websiteController.text.trim(),
                        address: addressController.text.trim(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B82F6),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      'Kaydet',
                      style: AppFonts.baseBold.copyWith(
                        color: AppColors.baseWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEditField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      style: AppFonts.baseRegular.copyWith(color: AppColors.baseWhite),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppFonts.baseRegular.copyWith(
          color: AppColors.baseWhite.withValues(alpha: 0.6),
        ),
        filled: true,
        fillColor: AppColors.baseWhite.withValues(alpha: 0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.baseWhite.withValues(alpha: 0.1),
          ),
        ),
      ),
    );
  }

  Future<void> _submitEdit({
    required String companyName,
    required String sector,
    required String phone,
    required String email,
    required String website,
    required String address,
  }) async {
    final result = await _homeViewModel.updateBusinessCard(_cardId, {
      "company_name": companyName.isEmpty ? null : companyName,
      "sector": sector.isEmpty ? null : sector,
      "phone": phone.isEmpty ? null : phone,
      "email": email.isEmpty ? null : email,
      "website": website.isEmpty ? null : website,
      "address": address.isEmpty ? null : address,
    });

    if (!mounted) return;

    if (result.isSuccess) {
      _cardWasChanged = true;
      await _loadDetail();
    } else {
      CustomBottomSheet.errorView(
        text: result.error?.message ?? 'Kartvizit güncellenemedi.',
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {},
      child: BaseDesign(
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
                  _buildHeaderRow(),
                  FigmaBox(height: 24),

                  Text(
                    widget.contact.name,
                    style: AppFonts.baseBold.copyWith(
                      fontSize: 28,
                      color: AppColors.baseWhite,
                      letterSpacing: -0.5,
                    ),
                  ),
                  FigmaBox(height: 8),
                  Text(
                    widget.contact.company,
                    style: AppFonts.baseRegular.copyWith(
                      fontSize: 16,
                      color: AppColors.baseWhite.withValues(alpha: 0.7),
                    ),
                  ),
                  FigmaBox(height: 16),

                  if (_isLoadingDetail)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 48),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else if (_detail != null) ...[
                    if ((_detail!.cards?.isNotEmpty ?? false)) ...[
                      _buildBusinessCardSection(),
                      FigmaBox(height: 24),
                    ],
                    _buildContactInformation(),
                    FigmaBox(height: 24),
                    _buildNotesActivity(),
                    FigmaBox(height: 24),
                    _buildTagsSection(),
                    FigmaBox(height: 24),
                    _buildActionButtons(),
                  ],
                  FigmaBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context, _cardWasChanged),
          child: FigmaContainer(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.baseWhite.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.baseWhite.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.baseWhite,
              size: 18,
            ),
          ),
        ),
        const Spacer(),
        if (_detail != null) ...[
          GestureDetector(
            onTap: _showEditSheet,
            child: FigmaContainer(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.baseWhite.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.baseWhite.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.edit_outlined,
                color: AppColors.baseWhite,
                size: 18,
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: _confirmDeleteCard,
            child: FigmaContainer(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.negative700.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.negative700.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.delete_outline,
                color: AppColors.negative300,
                size: 18,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildBusinessCardSection() {
    final images = _detail!.cards!;
    final current = images[_currentImageIndex.clamp(0, images.length - 1)];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.baseWhite.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.baseWhite.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Taranan Kartvizit',
              style: AppFonts.baseSemibold.copyWith(
                fontSize: 14,
                color: AppColors.baseWhite,
              ),
            ),
          ),
          Container(
            height: 180,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: (current.url?.isNotEmpty ?? false)
                  ? DecorationImage(
                      image: NetworkImage(current.url!),
                      fit: BoxFit.cover,
                    )
                  : null,
              color: AppColors.baseWhite.withValues(alpha: 0.05),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () => _deleteMedia(current),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 16,
                      color: AppColors.baseWhite,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          if (images.length > 1)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  images.length,
                  (index) => GestureDetector(
                    onTap: () => setState(() => _currentImageIndex = index),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentImageIndex == index ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentImageIndex == index
                            ? Color(0xFF3B82F6)
                            : AppColors.baseWhite.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
            )
          else
            const SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget _buildContactInformation() {
    final detail = _detail!;
    final sector = detail.sectorValue;
    final website = detail.websiteValue;
    final companyEmail = detail.emailValue;
    final companyPhone = detail.phoneValue;
    final country = detail.countryValue;

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
            color: _isContactInfoExpanded
                ? const Color(0xFF60A5FA).withValues(alpha: 0.3)
                : AppColors.baseWhite.withValues(alpha: 0.1),
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
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF60A5FA),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Bağlantı Bilgileri',
                  style: AppFonts.baseBold.copyWith(
                    fontSize: 18,
                    color: AppColors.baseWhite,
                  ),
                ),
                const Spacer(),
                AnimatedRotation(
                  duration: const Duration(milliseconds: 300),
                  turns: _isContactInfoExpanded ? 0.5 : 0,
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF60A5FA),
                    size: 28,
                  ),
                ),
              ],
            ),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState: _isContactInfoExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: const SizedBox(),
              secondChild: Column(
                children: [
                  FigmaBox(height: 24),
                  _buildContactInfoItem(
                    icon: Icons.business_center,
                    iconColor: const Color(0xFFF59E0B),
                    label: 'Firma Adı / Ünvan',
                    value: detail.companySummary,
                    onTap: () {},
                  ),
                  FigmaBox(height: 12),
                  _buildContactInfoItem(
                    icon: Icons.person,
                    iconColor: const Color(0xFF06B6D4),
                    label: 'İlgili Kişi Adı Soyadı',
                    value: detail.contactPerson,
                    onTap: () {},
                  ),
                  FigmaBox(height: 12),
                  _buildContactInfoItem(
                    icon: Icons.phone_in_talk,
                    iconColor: const Color(0xFF10B981),
                    label: 'İlgili Kişi Telefon',
                    value: detail.contactPhone,
                    onTap: () {
                      final contactPhone = detail.contactPhoneValue;
                      if (contactPhone == null) {
                        _showMissingFieldMessage(detail.contactPhone);
                        return;
                      }

                      _launchUrl(Uri.parse('tel:$contactPhone'));
                    },
                  ),
                  FigmaBox(height: 12),
                  _buildContactInfoItem(
                    icon: Icons.mark_email_read,
                    iconColor: const Color(0xFF3B82F6),
                    label: 'İlgili Kişi Mail',
                    value: detail.contactEmail,
                    onTap: () {
                      final contactEmail = detail.contactEmailValue;
                      if (contactEmail == null) {
                        _showMissingFieldMessage(detail.contactEmail);
                        return;
                      }

                      _launchUrl(Uri.parse('mailto:$contactEmail'));
                    },
                  ),
                  FigmaBox(height: 12),
                  _buildContactInfoItem(
                    icon: Icons.category,
                    iconColor: const Color(0xFFA855F7),
                    label: 'Hizmet / Sektör',
                    value: sector ?? 'Sektor bulunamadi',
                    onTap: () {},
                  ),
                  FigmaBox(height: 12),
                  _buildContactInfoItem(
                    icon: Icons.language,
                    iconColor: const Color(0xFF8B5CF6),
                    label: 'Web Sitesi',
                    value: website ?? 'Web sitesi bulunamadi',
                    onTap: () {
                      if (website == null) {
                        _showMissingFieldMessage('Web sitesi bulunamadi');
                        return;
                      }

                      _launchUrl(Uri.parse(website));
                    },
                  ),
                  FigmaBox(height: 12),
                  _buildContactInfoItem(
                    icon: Icons.email,
                    iconColor: const Color(0xFF60A5FA),
                    label: 'Firma Email',
                    value: companyEmail ?? 'Firma e-postasi bulunamadi',
                    onTap: () {
                      if (companyEmail == null) {
                        _showMissingFieldMessage('Firma e-postasi bulunamadi');
                        return;
                      }

                      _launchUrl(Uri.parse('mailto:$companyEmail'));
                    },
                  ),
                  FigmaBox(height: 12),
                  _buildContactInfoItem(
                    icon: Icons.phone,
                    iconColor: const Color(0xFF34D399),
                    label: 'Firma Telefon',
                    value: companyPhone ?? 'Firma telefonu bulunamadi',
                    onTap: () {
                      if (companyPhone == null) {
                        _showMissingFieldMessage('Firma telefonu bulunamadi');
                        return;
                      }

                      _launchUrl(Uri.parse('tel:$companyPhone'));
                    },
                  ),
                  FigmaBox(height: 12),
                  _buildContactInfoItem(
                    icon: Icons.flag,
                    iconColor: const Color(0xFFF97316),
                    label: 'Ülke',
                    value: country ?? 'Ulke bilgisi bulunamadi',
                    onTap: () {},
                  ),
                  FigmaBox(height: 12),
                  _buildContactInfoItem(
                    icon: Icons.location_on,
                    iconColor: const Color(0xFFEC4899),
                    label: 'Adres',
                    value: detail.location,
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
          border: Border.all(
            color: AppColors.baseWhite.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: isMultiline
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: iconColor.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: AppFonts.baseRegular.copyWith(
                      fontSize: 12,
                      color: AppColors.baseWhite.withValues(alpha: 0.6),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: AppFonts.baseSemibold.copyWith(
                      fontSize: 14,
                      color: AppColors.baseWhite,
                    ),
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
    final notes = _detail!.notes ?? const <BusinessCardNote>[];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.baseWhite.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _isNotesExpanded
              ? const Color(0xFF60A5FA).withValues(alpha: 0.3)
              : AppColors.baseWhite.withValues(alpha: 0.1),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: notes.length > 4
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
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF3B82F6),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Notlarım',
                  style: AppFonts.baseBold.copyWith(
                    fontSize: 16,
                    color: AppColors.baseWhite,
                  ),
                ),
                const Spacer(),
                if (notes.length > 4)
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 300),
                    turns: _isNotesExpanded ? 0.5 : 0,
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFF3B82F6),
                      size: 24,
                    ),
                  ),
              ],
            ),
          ),
          FigmaBox(height: 16),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _noteController,
                  style: AppFonts.baseRegular.copyWith(
                    color: AppColors.baseWhite,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Add a note...',
                    hintStyle: AppFonts.baseRegular.copyWith(
                      color: AppColors.baseWhite.withValues(alpha: 0.4),
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor: AppColors.baseWhite.withValues(alpha: 0.05),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColors.baseWhite.withValues(alpha: 0.1),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColors.baseWhite.withValues(alpha: 0.1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFF3B82F6),
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () => _saveNote(_noteController.text),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B82F6),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF3B82F6).withValues(alpha: 0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.add,
                    color: AppColors.baseWhite,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          FigmaBox(height: 20),

          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: _isNotesExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: Column(
              children: notes.reversed
                  .take(4)
                  .map(
                    (note) => _wrapWithDismissible(
                      note,
                      _buildActivityItem(note),
                    ),
                  )
                  .toList(),
            ),
            secondChild: Column(
              children: notes.reversed
                  .map(
                    (note) => _wrapWithDismissible(
                      note,
                      _buildActivityItem(note),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _wrapWithDismissible(BusinessCardNote note, Widget child) {
    return Dismissible(
      key: ValueKey('note_${note.id}'),
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
        _deleteNote(note);
      },
      background: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.negative700.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete_outline, color: AppColors.negative700),
      ),
      child: child,
    );
  }

  Widget _buildActivityItem(BusinessCardNote note) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.baseWhite.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.baseWhite.withValues(alpha: 0.1),
          width: 1,
        ),
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
              border: Border.all(
                color: Color(0xFF3B82F6).withValues(alpha: 0.3),
                width: 1,
              ),
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
                    Icon(
                      Icons.calendar_today,
                      size: 12,
                      color: AppColors.baseWhite.withValues(alpha: 0.5),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      note.createdAt ?? '',
                      style: AppFonts.baseRegular.copyWith(
                        fontSize: 12,
                        color: AppColors.baseWhite.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  note.note ?? '',
                  style: AppFonts.baseRegular.copyWith(
                    fontSize: 13,
                    color: AppColors.baseWhite.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTagsSection() {
    final sector = _detail!.sectorValue;

    return FigmaContainer(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.baseWhite.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.baseWhite.withValues(alpha: 0.1),
          width: 1,
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
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFA855F7),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Etiketler & Sektör',
                style: AppFonts.baseBold.copyWith(
                  fontSize: 16,
                  color: AppColors.baseWhite,
                ),
              ),
            ],
          ),
          FigmaBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FigmaContainer(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFA855F7).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFFA855F7).withValues(alpha: 0.4),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.category,
                      color: Color(0xFFA855F7),
                      size: 14,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      sector ?? 'Sektor bulunamadi',
                      style: AppFonts.baseBold.copyWith(
                        fontSize: 12,
                        color: const Color(0xFFA855F7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
                border: Border.all(
                  color: AppColors.positive500.withValues(alpha: 0.2),
                  width: 1.5,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.call, color: AppColors.baseWhite, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'WhatsApp',
                    style: AppFonts.baseSemibold.copyWith(
                      fontSize: 15,
                      color: AppColors.baseWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: GestureDetector(
            onTap: () => _makePhoneCall(_detail!.contactPhone),
            child: FigmaContainer(
              height: 56,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF3B82F6).withValues(alpha: 0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone_callback_sharp,
                    color: AppColors.baseWhite,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Ara',
                    style: AppFonts.baseBold.copyWith(
                      fontSize: 15,
                      color: AppColors.baseWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> onPressWhatsapp() async {
    final contactPhone = _detail?.contactPhoneValue;
    if (contactPhone == null) {
      _showMissingFieldMessage('Telefon bulunamadi');
      return;
    }

    final link = WhatsAppUnilink(phoneNumber: contactPhone, text: "");
    await launchUrl(Uri.parse('$link'));
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
      return;
    }

    _showMissingFieldMessage('Telefon aramasi baslatilamadi');
  }

  Future<void> _launchUrl(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      return;
    }

    _showMissingFieldMessage('Baglanti acilamadi');
  }

  void _showMissingFieldMessage(String message) {
    CustomBottomSheet.errorView(text: message);
  }
}
