import 'dart:io';

import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/models/personel/profile_response.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/features/home/viewmodel/home_view_model.dart';
import 'package:digivizit/features/meeting_requests/view_model/meeting_request_view_model.dart';
import 'package:digivizit/shared/components/base_design/base_design.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  final ProfileResponse profile;
  const HomeView({super.key, required this.profile});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  static const MethodChannel _iosSharePreviewChannel = MethodChannel(
    'digivizit/share_preview',
  );

  final HomeViewModel _homeViewModel = HomeViewModel();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isContactInfoExpanded = false;
  bool _isCompanyConnectionsExpanded = false;
  Color _topColor = const Color(0xFF2D1B69);
  Color _bottomColor = const Color(0xFF1A0F3D);

  ProfileData get personel => _homeViewModel.profile!;
  String get _profileName => _homeViewModel.profileName;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.15), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _homeViewModel.setInitialProfile(widget.profile);
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
  }

  @override
  void dispose() {
    _animationController.dispose();
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
              children: [
                FigmaBox(height: 75),
                _buildProfileSection(),
                FigmaBox(height: 32),
                /* _buildSocialMediaButtons(), */
                _buildContactInfoSection(),
                FigmaBox(height: 32),
                _buildCompanyConnectionsSection(),
                FigmaBox(height: 40),
                _buildActionButtons(),
                FigmaBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Profil Bölümü
  Widget _buildProfileSection() {
    return Column(
      children: [
        // Avatar Container
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.baseWhite, width: 4),
            boxShadow: [
              BoxShadow(
                color: AppColors.baseBlack.withValues(alpha: 0.3),
                blurRadius: 30,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.network(
              personel.photoUrl ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.neutral700,
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: AppColors.baseWhite,
                  ),
                );
              },
            ),
          ),
        ),
        FigmaBox(height: 24),
        // İsim
        Text(
          _profileName,
          style: AppFonts.baseBold.copyWith(
            fontSize: 28,
            color: AppColors.baseWhite,
            height: 1.2,
            letterSpacing: 0.5,
          ),
        ),
        FigmaBox(height: 12),
        // Unvan ve Şirket
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              personel.title ?? '',
              style: AppFonts.baseSemibold.copyWith(
                fontSize: 16,
                color: AppColors.baseWhite.withValues(alpha: 0.9),
              ),
            ),
            Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary500.withValues(alpha: 0.6),
              ),
            ),
            Text(
              personel.firm?.firmName ?? '',
              style: AppFonts.baseSemibold.copyWith(
                fontSize: 16,
                color: AppColors.baseWhite.withValues(alpha: 0.9),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Sosyal Medya Butonları
  /*  Widget _buildSocialMediaButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
          icon: Icons.business_center,
          label: "LinkedIn",
          onTap: () => _launchURL('https://linkedin.com'),
        ),
        const SizedBox(width: 16),
        _buildSocialButton(
          icon: Icons.camera_alt,
          label: "Instagram",
          onTap: () => _launchURL('https://instagram.com'),
        ),
        const SizedBox(width: 16),
        _buildSocialButton(
          icon: Icons.chat_bubble,
          label: "WhatsApp",
          onTap: () => _launchURL('https://wa.me/'),
        ),
        const SizedBox(width: 16),
        _buildSocialButton(
          icon: Icons.qr_code_2,
          label: "QR",
          onTap: () {
            // QR göster
          },
        ),
      ],
    );
  } */

  // İletişim Bilgileri Bölümü
  Widget _buildContactInfoSection() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isContactInfoExpanded = !_isContactInfoExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: appSizer.paddingAll(24),
        decoration: BoxDecoration(
          color: Color(0xFF1E293B).withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _isContactInfoExpanded
                ? Color(0xFF60A5FA).withValues(alpha: 0.3)
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
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF60A5FA),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  "İletişim Bilgileri",
                  style: AppFonts.baseBold.copyWith(
                    fontSize: 18,
                    color: AppColors.baseWhite,
                  ),
                ),
                const Spacer(),
                AnimatedRotation(
                  duration: const Duration(milliseconds: 300),
                  turns: _isContactInfoExpanded ? 0.5 : 0,
                  child: Icon(
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
                  _buildContactItem(
                    icon: Icons.email,
                    iconColor: Color(0xFF60A5FA),
                    label: "E-posta Adresi",
                    value: personel.email ?? 'Belirtilmemis',
                    onTap: () => _launchURL('mailto:${personel.email}'),
                  ),
                  FigmaBox(height: 20),
                  _buildContactItem(
                    icon: Icons.phone,
                    iconColor: Color(0xFF10B981),
                    label: "Telefon Numarası",
                    value: personel.phone ?? 'Belirtilmemis',
                    onTap: () => _launchURL('tel:${personel.phone}'),
                  ),
                  if ((personel.officeAddress?.streetAddress
                          ?.trim()
                          .isNotEmpty ??
                      false)) ...[
                    FigmaBox(height: 20),
                    _buildContactItem(
                      icon: Icons.location_on,
                      iconColor: Color(0xFFF59E0B),
                      label: "Adres",
                      value: personel.officeAddress!.streetAddress!,
                      onTap: () {},
                      isMultiline: true,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required VoidCallback onTap,
    bool isMultiline = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: isMultiline
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppFonts.baseRegular.copyWith(
                    fontSize: 13,
                    color: AppColors.baseWhite.withValues(alpha: 0.6),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: AppFonts.baseSemibold.copyWith(
                    fontSize: 15,
                    color: AppColors.baseWhite,
                  ),
                  maxLines: isMultiline ? 3 : 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.baseWhite.withValues(alpha: 0.4),
            size: 16,
          ),
        ],
      ),
    );
  }

  // Sosyal Medya (kişisel Instagram/LinkedIn bağlantıları)
  Widget _buildCompanyConnectionsSection() {
    final hasInstagram = (personel.instagramUrl?.trim().isNotEmpty ?? false);
    final hasLinkedin = (personel.linkedinUrl?.trim().isNotEmpty ?? false);
    if (!hasInstagram && !hasLinkedin) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          _isCompanyConnectionsExpanded = !_isCompanyConnectionsExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1E3A8A).withValues(alpha: 0.6),
              Color(0xFF1E293B).withValues(alpha: 0.4),
            ],
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _isCompanyConnectionsExpanded
                ? Color(0xFFF59E0B).withValues(alpha: 0.4)
                : AppColors.baseWhite.withValues(alpha: 0.15),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF1E3A8A).withValues(alpha: 0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Başlık
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFF59E0B).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.share_rounded,
                    color: Color(0xFFF59E0B),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Sosyal Medya",
                    style: AppFonts.baseBold.copyWith(
                      fontSize: 18,
                      color: AppColors.baseWhite,
                    ),
                  ),
                ),
                AnimatedRotation(
                  duration: const Duration(milliseconds: 300),
                  turns: _isCompanyConnectionsExpanded ? 0.5 : 0,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFFF59E0B),
                    size: 28,
                  ),
                ),
              ],
            ),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState: _isCompanyConnectionsExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: const SizedBox(),
              secondChild: Column(
                children: [
                  FigmaBox(height: 24),

                  // Sosyal Medya Butonları
                  Row(
                    children: [
                      if (hasLinkedin)
                        Expanded(
                          child: _buildCompanySocialButton(
                            icon: Icons.business_center,
                            label: "LinkedIn",
                            onTap: () => _launchURL(personel.linkedinUrl!),
                          ),
                        ),
                      if (hasLinkedin && hasInstagram)
                        const SizedBox(width: 12),
                      if (hasInstagram)
                        Expanded(
                          child: _buildCompanySocialButton(
                            icon: Icons.camera_alt,
                            label: "Instagram",
                            onTap: () => _launchURL(personel.instagramUrl!),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanySocialButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.baseWhite.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.baseWhite.withValues(alpha: 0.15),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.baseWhite.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.baseWhite, size: 24),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: AppFonts.baseRegular.copyWith(
                fontSize: 12,
                color: AppColors.baseWhite.withValues(alpha: 0.9),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Aksiyon Butonları
  Widget _buildActionButtons() {
    final meetingViewModel = MeetingRequestViewModel();
    return Column(
      children: [
        // TODO: Rehbere ekle kismi qr ile uygulama acilinca rehbere ekle cikacak
        _buildActionButton(
          icon: Icons.qr_code,
          text: "Qr Kodunu Göster",
          backgroundColor: Color(0xFF3B82F6),
          textColor: AppColors.baseWhite,
          onTap: _showQrCodePreview,
        ),
        FigmaBox(height: 20),
        // TODO: Görüşme talepleri kısmında gorusme linkini google takvimler veya baska bir kullanilan takvim uygulamasina ekleyerek entegrasyonu tamamla. su sekilde olabilir takvime ekle dedikten sonra hangi takvim uygulamasina eklemek istediginizi secin google takvim outlook apple takvim gibi secenekler olsun ve secilen takvim uygulamasina gore gorusme talebi linki olusturup ekleyin.
        _buildActionButton(
          icon: Icons.calendar_today,
          text: "Görüşme Talebi",
          backgroundColor: Color(0xFFA855F7),
          textColor: AppColors.baseWhite,
          onTap: () => meetingViewModel.getAppointmentRequests(),
        ),
        FigmaBox(height: 20),
        _buildActionButton(
          icon: Icons.download,
          text: "Kartvizit Paylas",
          backgroundColor: Color(0xFF1E293B),
          textColor: AppColors.baseWhite,
          onTap: _shareBusinessCardQr,
        ),
        FigmaBox(height: 20),
        _buildActionButton(
          icon: Icons.logout_rounded,
          text: "Oturumu Kapat",
          backgroundColor: Color(0xFFDC2626),
          textColor: AppColors.baseWhite,
          onTap: _confirmLogout,
        ),
        FigmaBox(height: 80),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [backgroundColor, backgroundColor.withValues(alpha: 0.8)],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: backgroundColor.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: textColor, size: 24),
            const SizedBox(width: 12),
            Text(
              text,
              style: AppFonts.baseBold.copyWith(
                fontSize: 17,
                color: textColor,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _confirmLogout() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.64),
      builder: (dialogContext) {
        final topTone = Color.lerp(_topColor, AppColors.baseBlack, 0.28)!;
        final bottomTone = Color.lerp(_bottomColor, AppColors.baseBlack, 0.4)!;

        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 32,
          ),
          child: Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  topTone.withValues(alpha: 0.96),
                  bottomTone.withValues(alpha: 0.98),
                ],
              ),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: AppColors.baseWhite.withValues(alpha: 0.14),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.32),
                  blurRadius: 28,
                  offset: const Offset(0, 18),
                ),
                BoxShadow(
                  color: AppColors.negative500.withValues(alpha: 0.14),
                  blurRadius: 40,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.negative400.withValues(alpha: 0.24),
                            AppColors.negative600.withValues(alpha: 0.16),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: AppColors.negative300.withValues(alpha: 0.22),
                        ),
                      ),
                      child: const Icon(
                        Icons.logout_rounded,
                        color: AppColors.negative300,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Oturumu Kapat',
                            style: AppFonts.lgBold.copyWith(
                              color: AppColors.baseWhite,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Bu cihazdaki aktif oturum sonlandirilacak.',
                            style: AppFonts.smSemibold.copyWith(
                              color: AppColors.baseWhite.withValues(
                                alpha: 0.72,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.baseWhite.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.baseWhite.withValues(alpha: 0.08),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        color: AppColors.warning300.withValues(alpha: 0.95),
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Cikis yaptiktan sonra tekrar kullanmak icin yeniden giris yapmaniz gerekecek. Devam etmek istiyor musunuz?',
                          style: AppFonts.baseSemibold.copyWith(
                            color: AppColors.baseWhite.withValues(alpha: 0.86),
                            height: 1.45,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _buildLogoutDialogAction(
                        text: 'Vazgec',
                        icon: Icons.arrow_back_rounded,
                        onTap: () => Navigator.of(dialogContext).pop(false),
                        isPrimary: false,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildLogoutDialogAction(
                        text: 'Cikis Yap',
                        icon: Icons.logout_rounded,
                        onTap: () => Navigator.of(dialogContext).pop(true),
                        isPrimary: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

    if (shouldLogout == true) {
      await AppSettings.instance.logout();
    }
  }

  Widget _buildLogoutDialogAction({
    required String text,
    required IconData icon,
    required VoidCallback onTap,
    required bool isPrimary,
  }) {
    final backgroundGradient = isPrimary
        ? const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColors.negative500, AppColors.negative700],
          )
        : LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.baseWhite.withValues(alpha: 0.10),
              AppColors.baseWhite.withValues(alpha: 0.06),
            ],
          );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Ink(
          height: 56,
          decoration: BoxDecoration(
            gradient: backgroundGradient,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isPrimary
                  ? AppColors.negative300.withValues(alpha: 0.18)
                  : AppColors.baseWhite.withValues(alpha: 0.12),
            ),
            boxShadow: isPrimary
                ? [
                    BoxShadow(
                      color: AppColors.negative500.withValues(alpha: 0.24),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: isPrimary
                    ? AppColors.baseWhite
                    : AppColors.baseWhite.withValues(alpha: 0.84),
              ),
              const SizedBox(width: 8),
              Text(
                text,
                style: AppFonts.baseBold.copyWith(
                  color: isPrimary
                      ? AppColors.baseWhite
                      : AppColors.baseWhite.withValues(alpha: 0.92),
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _shareBusinessCardQr() async {
    await _homeViewModel.ensureQrAndCardLoaded();
    final qrShareLink = _homeViewModel.qrShareLink;

    if (qrShareLink == null || qrShareLink.trim().isEmpty) {
      if (!mounted) return;

      await showDialog<void>(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('Paylasim hazir degil'),
            content: const Text(
              'Paylasilabilecek bir kartvizit baglantisi bulunamadi.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('Kapat'),
              ),
            ],
          );
        },
      );
      return;
    }

    final shareText = qrShareLink.trim();
    final shareTitle = _profileName.isEmpty
        ? 'QR Kodu'
        : '$_profileName QR Kodu';
    final shareOrigin = _sharePositionOrigin();

    try {
      if (Platform.isIOS) {
        final sharedWithCustomPreview = await _shareBusinessCardWithIosPreview(
          title: shareTitle,
          linkUrl: shareText,
          logoUrl: personel.photoUrl,
        );

        if (sharedWithCustomPreview) {
          return;
        }
      }

      await SharePlus.instance.share(
        ShareParams(
          text: shareText,
          title: shareTitle,
          sharePositionOrigin: shareOrigin,
        ),
      );
    } catch (_) {
      if (!mounted) return;

      await showDialog<void>(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('Paylasim basarisiz'),
            content: const Text(
              'QR paylasimi sirasinda bir sorun olustu. Lutfen tekrar deneyin.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('Kapat'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<bool> _shareBusinessCardWithIosPreview({
    required String title,
    required String linkUrl,
    String? logoUrl,
  }) async {
    try {
      await _iosSharePreviewChannel.invokeMethod<void>('shareBusinessCard', {
        'title': title,
        'linkUrl': linkUrl,
        'logoUrl': logoUrl,
      });
      return true;
    } on PlatformException {
      return false;
    } on MissingPluginException {
      return false;
    } catch (_) {
      return false;
    }
  }

  Rect? _sharePositionOrigin() {
    final renderObject = context.findRenderObject();
    if (renderObject is! RenderBox) {
      return null;
    }

    final offset = renderObject.localToGlobal(Offset.zero);
    return offset & renderObject.size;
  }

  Future<void> _showQrCodePreview() async {
    await _homeViewModel.ensureQrAndCardLoaded();
    final qrImageUrl = _homeViewModel.qrPhotoUrl;
    if (qrImageUrl == null) {
      if (!mounted) return;

      await showDialog<void>(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('QR kodu bulunamadi'),
            content: const Text(
              'Bu kullanici icin gosterilebilecek bir QR gorseli bulunmuyor.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('Kapat'),
              ),
            ],
          );
        },
      );
      return;
    }

    if (!mounted) return;

    await showDialog<void>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 32,
          ),
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF111827),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: AppColors.baseWhite.withValues(alpha: 0.12),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.35),
                  blurRadius: 28,
                  offset: const Offset(0, 16),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6).withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.qr_code_2,
                        color: Color(0xFF60A5FA),
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Kartvizit QR Kodu',
                        style: AppFonts.baseBold.copyWith(
                          fontSize: 18,
                          color: AppColors.baseWhite,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      icon: Icon(
                        Icons.close,
                        color: AppColors.baseWhite.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    constraints: const BoxConstraints(
                      maxHeight: 420,
                      minHeight: 220,
                    ),
                    width: double.infinity,
                    color: Colors.white,
                    child: InteractiveViewer(
                      minScale: 1,
                      maxScale: 4,
                      child: Image.network(
                        qrImageUrl,
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          final totalBytes = loadingProgress.expectedTotalBytes;
                          final loadedBytes =
                              loadingProgress.cumulativeBytesLoaded;
                          final progress = totalBytes == null
                              ? null
                              : loadedBytes / totalBytes;

                          return Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircularProgressIndicator(value: progress),
                                const SizedBox(height: 16),
                                Text(
                                  'QR gorseli yukleniyor...',
                                  style: AppFonts.baseRegular.copyWith(
                                    fontSize: 13,
                                    color: AppColors.baseBlack,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.broken_image_outlined,
                                    size: 46,
                                    color: Color(0xFF64748B),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'QR gorseli acilamadi.',
                                    textAlign: TextAlign.center,
                                    style: AppFonts.baseBold.copyWith(
                                      fontSize: 15,
                                      color: AppColors.baseBlack,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Baglanti gecersiz olabilir veya gorsel sunucuda ulasilamiyor olabilir.',
                                    textAlign: TextAlign.center,
                                    style: AppFonts.baseRegular.copyWith(
                                      fontSize: 12,
                                      color: const Color(0xFF475569),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
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
}
