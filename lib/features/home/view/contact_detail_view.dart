import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/models/business_cards/contacts_response.dart';
import 'package:digivizit/core/providers/app_settings.dart';
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
  final Color _topColor = const Color(0xFFF8F9FB);
  final Color _bottomColor = const Color(0xFFFFFFFF);
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
      backgroundColor: AppColors.baseWhite,
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
                    color: AppColors.ink,
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
      style: AppFonts.baseRegular.copyWith(color: AppColors.ink),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppFonts.baseRegular.copyWith(color: AppColors.inkSoft),
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.hairline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.hairline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary500, width: 1.5),
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
        backgroundWidget: _buildPageBackground(),
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
                  FigmaBox(height: 20),
                  _buildProfileHero(),
                  FigmaBox(height: 20),

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

  Widget _buildPageBackground() {
    return Stack(
      fit: StackFit.expand,
      children: [
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFF3F7FF),
                AppColors.surface,
                Color(0xFFFBFCFF),
                AppColors.baseWhite,
              ],
              stops: [0, 0.32, 0.72, 1],
            ),
          ),
        ),
        Positioned(
          top: -90,
          right: -110,
          child: _buildBackgroundGlow(
            size: 330,
            color: AppColors.primary200.withValues(alpha: 0.42),
          ),
        ),
        Positioned(
          top: 430,
          left: -150,
          child: _buildBackgroundGlow(
            size: 320,
            color: const Color(0xFFDDD6FE).withValues(alpha: 0.28),
          ),
        ),
        Positioned(
          bottom: -130,
          right: -100,
          child: _buildBackgroundGlow(
            size: 340,
            color: const Color(0xFFCFFAFE).withValues(alpha: 0.30),
          ),
        ),
        const Positioned.fill(
          child: IgnorePointer(
            child: CustomPaint(painter: _DetailBackgroundPatternPainter()),
          ),
        ),
      ],
    );
  }

  Widget _buildBackgroundGlow({required double size, required Color color}) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(colors: [color, color.withValues(alpha: 0)]),
        ),
      ),
    );
  }

  Widget _buildProfileHero() {
    final detail = _detail;
    final name = detail?.name ?? widget.contact.name;
    final company = detail?.companyValue ?? widget.contact.company;
    final position = detail?.positionValue;
    final sector = detail?.sectorValue ?? widget.contact.sectorValue;
    final thumbnail = widget.contact.thumbnail?.trim() ?? '';
    final hasThumbnail =
        (widget.contact.hasImage ?? false) && thumbnail.isNotEmpty;

    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.baseWhite,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.hairline),
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withValues(alpha: 0.06),
            blurRadius: 22,
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 4,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary400, AppColors.primary600],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [AppColors.primary400, AppColors.primary600],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary500.withValues(alpha: 0.20),
                            blurRadius: 14,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: hasThumbnail
                          ? Image.network(
                              thumbnail,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                                  _buildHeroInitials(name),
                            )
                          : _buildHeroInitials(name),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 7,
                                height: 7,
                                decoration: const BoxDecoration(
                                  color: AppColors.positive500,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 7),
                              Text(
                                'KAYITLI BAĞLANTI',
                                style: AppFonts.xsBold.copyWith(
                                  color: AppColors.primary600,
                                  letterSpacing: 0.7,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            name,
                            style: AppFonts.xl2Bold.copyWith(
                              color: AppColors.ink,
                              letterSpacing: -0.4,
                              height: 1.15,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            company,
                            style: AppFonts.base2Regular.withColor(
                              AppColors.inkSoft,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (position != null || sector != null) ...[
                  const SizedBox(height: 18),
                  const Divider(height: 1, color: AppColors.hairline),
                  const SizedBox(height: 14),
                  if (position != null && sector != null)
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: _buildHeroMetaTile(
                              icon: Icons.workspace_premium_rounded,
                              label: 'Ünvan',
                              value: position,
                              color: const Color(0xFF8B5CF6),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _buildHeroMetaTile(
                              icon: Icons.category_rounded,
                              label: 'Sektör',
                              value: sector,
                              color: AppColors.primary600,
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    _buildHeroMetaTile(
                      icon: position != null
                          ? Icons.workspace_premium_rounded
                          : Icons.category_rounded,
                      label: position != null ? 'Ünvan' : 'Sektör',
                      value: position ?? sector!,
                      color: position != null
                          ? const Color(0xFF8B5CF6)
                          : AppColors.primary600,
                    ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroInitials(String name) {
    final parts = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .toList();
    final initials = parts.isEmpty
        ? '?'
        : parts.length == 1
        ? parts.first.characters.first.toUpperCase()
        : (parts.first.characters.first + parts.last.characters.first)
              .toUpperCase();

    return Center(
      child: Text(
        initials,
        style: AppFonts.xl2Bold.withColor(AppColors.baseWhite),
      ),
    );
  }

  Widget _buildHeroMetaTile({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.hairline),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(icon, size: 19, color: color),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppFonts.xsSemibold.withColor(AppColors.inkSoft),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: AppFonts.smBold.copyWith(
                    color: AppColors.ink,
                    height: 1.3,
                  ),
                ),
              ],
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
              color: AppColors.baseWhite,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.hairline, width: 1),
              boxShadow: [
                BoxShadow(
                  color: AppColors.ink.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.ink,
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
                color: AppColors.baseWhite,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.hairline, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.ink.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                Icons.edit_outlined,
                color: AppColors.primary600,
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
        color: AppColors.baseWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.hairline, width: 1),
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
                color: AppColors.ink,
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
              color: AppColors.surface,
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
                            : AppColors.hairline,
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

    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            setState(() {
              _isContactInfoExpanded = !_isContactInfoExpanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 260),
            curve: Curves.easeOutCubic,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.baseWhite,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: _isContactInfoExpanded
                    ? AppColors.primary300
                    : AppColors.hairline,
              ),
              boxShadow: [
                BoxShadow(
                  color: _isContactInfoExpanded
                      ? AppColors.primary500.withValues(alpha: 0.10)
                      : AppColors.ink.withValues(alpha: 0.04),
                  blurRadius: _isContactInfoExpanded ? 22 : 14,
                  offset: const Offset(0, 7),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primary500.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.contact_page_rounded,
                    color: AppColors.primary600,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bağlantı Bilgileri',
                        style: AppFonts.lgBold.withColor(AppColors.ink),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Detaylı bilgi için tıklayınız',
                        style: AppFonts.smRegular.withColor(AppColors.inkSoft),
                      ),
                    ],
                  ),
                ),
                AnimatedRotation(
                  duration: const Duration(milliseconds: 260),
                  turns: _isContactInfoExpanded ? 0.5 : 0,
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.primary600,
                    size: 27,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 280),
          sizeCurve: Curves.easeOutCubic,
          crossFadeState: _isContactInfoExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: const SizedBox(width: double.infinity),
          secondChild: Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Column(
              children: [
                _ContactInfoGroupCard(
                  key: const ValueKey('corporate-info'),
                  title: 'Kurumsal Bilgiler',
                  subtitle: 'Firma, ünvan ve sektör',
                  icon: Icons.apartment_rounded,
                  accentColor: AppColors.primary600,
                  children: [
                    _buildContactInfoItem(
                      icon: Icons.business_center_rounded,
                      iconColor: const Color(0xFFF59E0B),
                      label: 'Firma Adı',
                      value: detail.company,
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    _buildContactInfoItem(
                      icon: Icons.workspace_premium_rounded,
                      iconColor: const Color(0xFF8B5CF6),
                      label: 'Ünvan',
                      value: detail.position,
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    _buildContactInfoItem(
                      icon: Icons.category_rounded,
                      iconColor: const Color(0xFFA855F7),
                      label: 'Hizmet / Sektör',
                      value: sector ?? 'Sektör bulunamadı',
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _ContactInfoGroupCard(
                  key: const ValueKey('contact-person-info'),
                  title: 'İlgili Kişi',
                  subtitle: 'Kişi ve doğrudan iletişim bilgileri',
                  icon: Icons.person_rounded,
                  accentColor: const Color(0xFF06B6D4),
                  children: [
                    _buildContactInfoItem(
                      icon: Icons.person_outline_rounded,
                      iconColor: const Color(0xFF06B6D4),
                      label: 'Adı Soyadı',
                      value: detail.contactPerson,
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    _buildContactInfoItem(
                      icon: Icons.phone_in_talk_rounded,
                      iconColor: const Color(0xFF10B981),
                      label: 'Telefon',
                      value: detail.contactPhone,
                      onTap: () {
                        final contactPhone = detail.contactPhoneValue;
                        if (contactPhone == null) {
                          _showMissingFieldMessage(detail.contactPhone);
                          return;
                        }
                        _launchUrl(Uri.parse('tel:$contactPhone'));
                      },
                      isActionable: true,
                    ),
                    const SizedBox(height: 10),
                    _buildContactInfoItem(
                      icon: Icons.mark_email_read_rounded,
                      iconColor: AppColors.primary500,
                      label: 'E-posta',
                      value: detail.contactEmail,
                      onTap: () {
                        final contactEmail = detail.contactEmailValue;
                        if (contactEmail == null) {
                          _showMissingFieldMessage(detail.contactEmail);
                          return;
                        }
                        _launchUrl(Uri.parse('mailto:$contactEmail'));
                      },
                      isActionable: true,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _ContactInfoGroupCard(
                  key: const ValueKey('company-contact-info'),
                  title: 'Firma İletişimi',
                  subtitle: 'Firma kanalları ve web sitesi',
                  icon: Icons.alternate_email_rounded,
                  accentColor: AppColors.positive600,
                  children: [
                    _buildContactInfoItem(
                      icon: Icons.email_outlined,
                      iconColor: AppColors.primary400,
                      label: 'Firma E-posta',
                      value: companyEmail ?? 'Firma e-postası bulunamadı',
                      onTap: () {
                        if (companyEmail == null) {
                          _showMissingFieldMessage(
                            'Firma e-postası bulunamadı',
                          );
                          return;
                        }
                        _launchUrl(Uri.parse('mailto:$companyEmail'));
                      },
                      isActionable: true,
                    ),
                    const SizedBox(height: 10),
                    _buildContactInfoItem(
                      icon: Icons.phone_rounded,
                      iconColor: AppColors.positive500,
                      label: 'Firma Telefon',
                      value: companyPhone ?? 'Firma telefonu bulunamadı',
                      onTap: () {
                        if (companyPhone == null) {
                          _showMissingFieldMessage('Firma telefonu bulunamadı');
                          return;
                        }
                        _launchUrl(Uri.parse('tel:$companyPhone'));
                      },
                      isActionable: true,
                    ),
                    const SizedBox(height: 10),
                    _buildContactInfoItem(
                      icon: Icons.language_rounded,
                      iconColor: const Color(0xFF8B5CF6),
                      label: 'Web Sitesi',
                      value: website ?? 'Web sitesi bulunamadı',
                      onTap: () {
                        if (website == null) {
                          _showMissingFieldMessage('Web sitesi bulunamadı');
                          return;
                        }
                        _launchUrl(Uri.parse(website));
                      },
                      isActionable: true,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _ContactInfoGroupCard(
                  key: const ValueKey('location-info'),
                  title: 'Konum',
                  subtitle: 'Ülke ve adres bilgileri',
                  icon: Icons.location_on_rounded,
                  accentColor: const Color(0xFFF97316),
                  children: [
                    _buildContactInfoItem(
                      icon: Icons.flag_rounded,
                      iconColor: const Color(0xFFF97316),
                      label: 'Ülke',
                      value: country ?? 'Ülke bilgisi bulunamadı',
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    _buildContactInfoItem(
                      icon: Icons.map_outlined,
                      iconColor: const Color(0xFFEC4899),
                      label: 'Adres',
                      value: detail.location,
                      onTap: () {},
                      isMultiline: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfoItem({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required VoidCallback onTap,
    bool isMultiline = false,
    bool isActionable = false,
  }) {
    return _ExpandableContactInfoItem(
      icon: icon,
      iconColor: iconColor,
      label: label,
      value: value,
      onTap: onTap,
      collapsedMaxLines: isMultiline ? 2 : 1,
      isActionable: isActionable,
    );
  }

  Widget _buildNotesActivity() {
    final notes = _detail!.notes ?? const <BusinessCardNote>[];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOutCubic,
      decoration: BoxDecoration(
        color: AppColors.baseWhite,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: _isNotesExpanded ? AppColors.primary300 : AppColors.hairline,
        ),
        boxShadow: [
          BoxShadow(
            color: _isNotesExpanded
                ? AppColors.primary500.withValues(alpha: 0.09)
                : AppColors.ink.withValues(alpha: 0.04),
            blurRadius: _isNotesExpanded ? 22 : 14,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                _isNotesExpanded = !_isNotesExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.primary500.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.sticky_note_2_rounded,
                      color: AppColors.primary600,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notlarım',
                          style: AppFonts.lgBold.withColor(AppColors.ink),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          notes.isEmpty
                              ? 'Henüz kayıtlı not bulunmuyor'
                              : notes.length == 1
                              ? '1 kayıtlı not'
                              : '${notes.length} kayıtlı not',
                          style: AppFonts.smRegular.withColor(
                            AppColors.inkSoft,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 260),
                    turns: _isNotesExpanded ? 0.5 : 0,
                    child: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.primary600,
                      size: 27,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 280),
            sizeCurve: Curves.easeOutCubic,
            crossFadeState: _isNotesExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox(width: double.infinity),
            secondChild: Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
              child: Column(
                children: [
                  const Divider(height: 1, color: AppColors.hairline),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _noteController,
                          style: AppFonts.baseRegular.copyWith(
                            color: AppColors.ink,
                            fontSize: 14,
                          ),
                          minLines: 1,
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: 'Yeni bir not yazın...',
                            hintStyle: AppFonts.baseRegular.copyWith(
                              color: AppColors.inkFaint,
                              fontSize: 14,
                            ),
                            filled: true,
                            fillColor: AppColors.surface,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(
                                color: AppColors.hairline,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(
                                color: AppColors.hairline,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(
                                color: AppColors.primary500,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () => _saveNote(_noteController.text),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColors.primary400,
                                AppColors.primary600,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary500.withValues(
                                  alpha: 0.25,
                                ),
                                blurRadius: 12,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.add_rounded,
                            color: AppColors.baseWhite,
                            size: 26,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  if (notes.isEmpty)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.hairline),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.note_alt_outlined,
                            color: AppColors.inkFaint,
                            size: 30,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'İlk notunuzu ekleyebilirsiniz',
                            style: AppFonts.smSemibold.withColor(
                              AppColors.inkSoft,
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    Column(
                      children: notes.reversed
                          .map(
                            (note) => _wrapWithDismissible(
                              note,
                              _buildActivityItem(note),
                            ),
                          )
                          .toList(),
                    ),
                ],
              ),
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
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.hairline, width: 1),
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
                      color: AppColors.inkFaint,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _formatNoteDate(note.createdAt),
                      style: AppFonts.baseRegular.copyWith(
                        fontSize: 12,
                        color: AppColors.inkFaint,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  note.note ?? '',
                  style: AppFonts.baseRegular.copyWith(
                    fontSize: 13,
                    color: AppColors.ink,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatNoteDate(String? rawDate) {
    final value = rawDate?.trim();
    if (value == null || value.isEmpty) return 'Tarih bulunamadı';

    final parsed = DateTime.tryParse(value);
    if (parsed == null) return value;

    final localDate = parsed.isUtc ? parsed.toLocal() : parsed;
    return DateFormat('dd.MM.yyyy HH.mm').format(localDate);
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

class _DetailBackgroundPatternPainter extends CustomPainter {
  const _DetailBackgroundPatternPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary500.withValues(alpha: 0.035);
    var row = 0;

    for (double y = 24; y < size.height; y += 36) {
      final startX = row.isEven ? 20.0 : 38.0;
      for (double x = startX; x < size.width; x += 36) {
        canvas.drawCircle(Offset(x, y), 1.1, paint);
      }
      row++;
    }
  }

  @override
  bool shouldRepaint(covariant _DetailBackgroundPatternPainter oldDelegate) {
    return false;
  }
}

class _ContactInfoGroupCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color accentColor;
  final List<Widget> children;

  const _ContactInfoGroupCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accentColor,
    required this.children,
  });

  @override
  State<_ContactInfoGroupCard> createState() => _ContactInfoGroupCardState();
}

class _ContactInfoGroupCardState extends State<_ContactInfoGroupCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOutCubic,
      decoration: BoxDecoration(
        color: AppColors.baseWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: _isExpanded
              ? widget.accentColor.withValues(alpha: 0.38)
              : AppColors.hairline,
        ),
        boxShadow: [
          BoxShadow(
            color: _isExpanded
                ? widget.accentColor.withValues(alpha: 0.08)
                : AppColors.ink.withValues(alpha: 0.035),
            blurRadius: _isExpanded ? 20 : 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: widget.accentColor.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      widget.icon,
                      size: 22,
                      color: widget.accentColor,
                    ),
                  ),
                  const SizedBox(width: 13),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: AppFonts.base2Bold.withColor(AppColors.ink),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.subtitle,
                          style: AppFonts.smRegular.withColor(
                            AppColors.inkSoft,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 240),
                    turns: _isExpanded ? 0.5 : 0,
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: _isExpanded
                          ? widget.accentColor
                          : AppColors.inkFaint,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 260),
            sizeCurve: Curves.easeOutCubic,
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox(width: double.infinity),
            secondChild: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
              child: Column(children: widget.children),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpandableContactInfoItem extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final VoidCallback onTap;
  final int collapsedMaxLines;
  final bool isActionable;

  const _ExpandableContactInfoItem({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.onTap,
    required this.collapsedMaxLines,
    required this.isActionable,
  });

  @override
  State<_ExpandableContactInfoItem> createState() =>
      _ExpandableContactInfoItemState();
}

class _ExpandableContactInfoItemState
    extends State<_ExpandableContactInfoItem> {
  bool _isExpanded = false;

  @override
  void didUpdateWidget(covariant _ExpandableContactInfoItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _isExpanded = false;
    }
  }

  void _toggleExpanded() {
    setState(() => _isExpanded = !_isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    final valueStyle = AppFonts.baseSemibold.copyWith(
      fontSize: 14,
      color: AppColors.ink,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        const horizontalSpaceWithoutText = 24.0 + 40.0 + 12.0;
        final calculatedWidth =
            constraints.maxWidth - horizontalSpaceWithoutText;
        final availableTextWidth = calculatedWidth > 0 ? calculatedWidth : 0.0;
        final textPainter = TextPainter(
          text: TextSpan(text: widget.value, style: valueStyle),
          maxLines: widget.collapsedMaxLines,
          textDirection: Directionality.of(context),
          textScaler: MediaQuery.textScalerOf(context),
        )..layout(maxWidth: availableTextWidth);
        final canExpand = textPainter.didExceedMaxLines;
        final isExpanded = canExpand && _isExpanded;

        return Semantics(
          button: canExpand || widget.isActionable,
          expanded: canExpand ? isExpanded : null,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: canExpand && !widget.isActionable
                ? _toggleExpanded
                : widget.onTap,
            child: AnimatedSize(
              duration: const Duration(milliseconds: 240),
              curve: Curves.easeOutCubic,
              alignment: Alignment.topCenter,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 240),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isExpanded
                      ? widget.iconColor.withValues(alpha: 0.06)
                      : AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isExpanded
                        ? widget.iconColor.withValues(alpha: 0.35)
                        : AppColors.hairline,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: widget.collapsedMaxLines > 1 || isExpanded
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: widget.iconColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: widget.iconColor.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Icon(
                        widget.icon,
                        color: widget.iconColor,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: canExpand ? _toggleExpanded : null,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.label,
                              style: AppFonts.baseRegular.copyWith(
                                fontSize: 12,
                                color: AppColors.inkSoft,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              widget.value,
                              style: valueStyle,
                              maxLines: isExpanded
                                  ? null
                                  : widget.collapsedMaxLines,
                              overflow: isExpanded
                                  ? TextOverflow.visible
                                  : TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (canExpand) ...[
                      const SizedBox(width: 8),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: _toggleExpanded,
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: AnimatedRotation(
                            duration: const Duration(milliseconds: 240),
                            turns: isExpanded ? 0.5 : 0,
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: isExpanded
                                  ? widget.iconColor
                                  : AppColors.inkFaint,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
