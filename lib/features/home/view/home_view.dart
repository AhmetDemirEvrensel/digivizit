import 'dart:io';

import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/models/personel/profile_response.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/features/home/viewmodel/home_view_model.dart';
import 'package:digivizit/features/meeting_requests/view_model/meeting_request_view_model.dart';
import 'package:digivizit/shared/components/alert/custom_dialog.dart';
import 'package:digivizit/shared/components/base_design/base_design.dart';
import 'package:digivizit/shared/components/buttons/pressable_scale.dart';
import 'package:digivizit/shared/components/card/flippable_business_card.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  final ProfileResponse profile;
  const HomeView({super.key, required this.profile});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static const MethodChannel _iosSharePreviewChannel = MethodChannel(
    'digivizit/share_preview',
  );

  static const _ink = Color(0xFF0F172A);
  static const _inkSoft = Color(0xFF64748B);
  static const _hairline = Color(0xFFE2E8F0);

  final HomeViewModel _homeViewModel = HomeViewModel();
  bool _isContactInfoExpanded = true;

  ProfileData get personel => _homeViewModel.profile!;
  String get _profileName => _homeViewModel.profileName;

  @override
  void initState() {
    super.initState();
    _homeViewModel.setInitialProfile(widget.profile);
    _homeViewModel.ensureQrAndCardLoaded().then((_) {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final entrance = <Widget>[
      FigmaBox(height: 68),
      _buildTopBar(),
      FigmaBox(height: 24),
      FlippableBusinessCard(
        name: _profileName.isEmpty ? (personel.fullName ?? '') : _profileName,
        title: personel.title,
        company: personel.firm?.firmName,
        email: personel.email,
        phone: personel.phone,
        photoUrl: personel.photoUrl,
        qrData: _homeViewModel.qrShareLink,
      ),
      FigmaBox(height: 24),
      _buildActionRow(),
      FigmaBox(height: 28),
      _buildContactInfoSection(),
      if (_hasSocials) ...[FigmaBox(height: 16), _buildSocialRow()],
      FigmaBox(height: 120),
    ];

    return BaseDesign(
      topColor: const Color(0xFFF8F9FB),
      bottomColor: const Color(0xFFFFFFFF),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: entrance
              .animate(interval: 80.ms)
              .fadeIn(duration: 450.ms, curve: Curves.easeOutCubic)
              .slideY(begin: 0.06, end: 0, curve: Curves.easeOutCubic),
        ),
      ],
    );
  }

  bool get _hasSocials =>
      (personel.instagramUrl?.trim().isNotEmpty ?? false) ||
      (personel.linkedinUrl?.trim().isNotEmpty ?? false);

  Widget _buildTopBar() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Merhaba,',
                style: AppFonts.base2Regular.withColor(_inkSoft),
              ),
              const SizedBox(height: 2),
              Text(
                _profileName.isEmpty ? 'Hoş geldin' : _profileName,
                style: AppFonts.xl2Bold.withColor(_ink),
              ),
            ],
          ),
        ),
        _buildIconButton(
          icon: Icons.logout_rounded,
          color: AppColors.negative500,
          onTap: _confirmLogout,
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: AppColors.baseWhite,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _hairline),
          boxShadow: [
            BoxShadow(
              color: _ink.withValues(alpha: 0.05),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(icon, color: color, size: 20),
      ),
    );
  }

  Widget _buildActionRow() {
    final meetingViewModel = MeetingRequestViewModel();

    return Column(
      children: [
        _buildActionCard(
          icon: Icons.ios_share_rounded,
          title: 'Kartı Paylaş',
          subtitle: 'QR bağlantını hızlıca paylaş',
          onTap: _shareBusinessCardQr,
          isPrimary: true,
        ),
        const SizedBox(height: 12),
        _buildActionCard(
          icon: Icons.calendar_month_rounded,
          title: 'Görüşmeler',
          subtitle: 'Görüşme taleplerini görüntüle',
          onTap: () => meetingViewModel.getAppointmentRequests(),
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isPrimary = false,
  }) {
    final foreground = isPrimary ? AppColors.baseWhite : _ink;
    final mutedForeground = isPrimary
        ? AppColors.baseWhite.withValues(alpha: 0.78)
        : _inkSoft;

    return PressableScale(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isPrimary ? null : AppColors.baseWhite,
          gradient: isPrimary
              ? const LinearGradient(
                  colors: [AppColors.primary600, AppColors.primary400],
                )
              : null,
          borderRadius: BorderRadius.circular(18),
          border: isPrimary ? null : Border.all(color: _hairline),
          boxShadow: [
            BoxShadow(
              color: isPrimary
                  ? AppColors.primary500.withValues(alpha: 0.24)
                  : _ink.withValues(alpha: 0.05),
              blurRadius: isPrimary ? 20 : 12,
              offset: Offset(0, isPrimary ? 10 : 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: isPrimary
                    ? AppColors.baseWhite.withValues(alpha: 0.16)
                    : AppColors.primary100,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(
                icon,
                color: isPrimary ? AppColors.baseWhite : AppColors.primary600,
                size: 22,
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppFonts.lgBold.withColor(foreground)),
                  const SizedBox(height: 1),
                  Text(
                    subtitle,
                    style: AppFonts.smRegular.withColor(mutedForeground),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_rounded,
              color: isPrimary
                  ? AppColors.baseWhite.withValues(alpha: 0.9)
                  : AppColors.primary500,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfoSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.baseWhite,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: _hairline),
        boxShadow: [
          BoxShadow(
            color: _ink.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                _isContactInfoExpanded = !_isContactInfoExpanded;
              });
            },
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary500,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'İletişim Bilgileri',
                  style: AppFonts.lgBold.withColor(_ink),
                ),
                const Spacer(),
                AnimatedRotation(
                  duration: const Duration(milliseconds: 300),
                  turns: _isContactInfoExpanded ? 0.5 : 0,
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.primary500,
                    size: 26,
                  ),
                ),
              ],
            ),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: _isContactInfoExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox(width: double.infinity),
            secondChild: Column(
              children: [
                const SizedBox(height: 18),
                _buildContactRow(
                  icon: Icons.email_rounded,
                  iconColor: AppColors.primary500,
                  label: 'E-posta Adresi',
                  value: personel.email ?? 'Belirtilmemiş',
                  onTap: () => _launchURL('mailto:${personel.email}'),
                ),
                _buildDivider(),
                _buildContactRow(
                  icon: Icons.phone_rounded,
                  iconColor: const Color(0xFF10B981),
                  label: 'Telefon Numarası',
                  value: personel.phone ?? 'Belirtilmemiş',
                  onTap: () => _launchURL('tel:${personel.phone}'),
                ),
                if ((personel.officeAddress?.streetAddress?.trim().isNotEmpty ??
                    false)) ...[
                  _buildDivider(),
                  _buildContactRow(
                    icon: Icons.location_on_rounded,
                    iconColor: const Color(0xFFF59E0B),
                    label: 'Adres',
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
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Divider(height: 1, thickness: 1, color: Color(0xFFF1F5F9)),
    );
  }

  Widget _buildContactRow({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required VoidCallback onTap,
    bool isMultiline = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        crossAxisAlignment: isMultiline
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppFonts.xsRegular.withColor(_inkSoft)),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: AppFonts.base2Semibold.withColor(_ink),
                  maxLines: isMultiline ? 3 : 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: _inkSoft.withValues(alpha: 0.4),
            size: 14,
          ),
        ],
      ),
    );
  }

  Widget _buildSocialRow() {
    final hasInstagram = (personel.instagramUrl?.trim().isNotEmpty ?? false);
    final hasLinkedin = (personel.linkedinUrl?.trim().isNotEmpty ?? false);

    return Row(
      children: [
        if (hasLinkedin)
          Expanded(
            child: _buildSocialChip(
              icon: Icons.business_center_rounded,
              label: 'LinkedIn',
              onTap: () => _launchURL(personel.linkedinUrl!),
            ),
          ),
        if (hasLinkedin && hasInstagram) const SizedBox(width: 12),
        if (hasInstagram)
          Expanded(
            child: _buildSocialChip(
              icon: Icons.camera_alt_rounded,
              label: 'Instagram',
              onTap: () => _launchURL(personel.instagramUrl!),
            ),
          ),
      ],
    );
  }

  Widget _buildSocialChip({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return PressableScale(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.baseWhite,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: _hairline),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primary600, size: 18),
            const SizedBox(width: 8),
            Text(label, style: AppFonts.baseSemibold.withColor(_ink)),
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
    final shouldLogout = await showCustomDialog(
      context: context,
      title: 'Oturumu Kapat',
      message:
          'Çıkış yaptıktan sonra tekrar kullanmak için yeniden giriş yapmanız gerekecek. Devam etmek istiyor musunuz?',
      status: CustomDialogStatus.destructive,
      icon: Icons.logout_rounded,
      confirmText: 'Çıkış Yap',
      cancelText: 'Vazgeç',
    );

    if (shouldLogout == true) {
      await AppSettings.instance.logout();
    }
  }

  Future<void> _shareBusinessCardQr() async {
    await _homeViewModel.ensureQrAndCardLoaded();
    final qrShareLink = _homeViewModel.qrShareLink;

    if (qrShareLink == null || qrShareLink.trim().isEmpty) {
      if (!mounted) return;
      _showInfoDialog(
        title: 'Paylaşım hazır değil',
        message: 'Paylaşılabilecek bir kartvizit bağlantısı bulunamadı.',
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
      _showInfoDialog(
        title: 'Paylaşım başarısız',
        message:
            'QR paylaşımı sırasında bir sorun oluştu. Lütfen tekrar deneyin.',
      );
    }
  }

  void _showInfoDialog({required String title, required String message}) {
    showCustomDialog(
      context: context,
      title: title,
      message: message,
      status: CustomDialogStatus.info,
      confirmText: 'Kapat',
    );
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
}
