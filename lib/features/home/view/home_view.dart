import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/models/personel/get_personel_info_response.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/features/meeting_requests/view/meeting_requests_view.dart';
import 'package:digivizit/shared/components/base_design/base_design.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  final GetPersonelInfoResponse personelInfo;
  const HomeView({super.key, required this.personelInfo});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isContactInfoExpanded = false;
  bool _isCompanyConnectionsExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic));

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
      backgroundWidget: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF2D1B69), Color(0xFF1A0F3D)]),
        ),
      ),
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
            boxShadow: [BoxShadow(color: AppColors.baseBlack.withValues(alpha: 0.3), blurRadius: 30, offset: const Offset(0, 15))],
          ),
          child: ClipOval(
            child: Image.network(
              'https://via.placeholder.com/160',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.neutral700,
                  child: Icon(Icons.person, size: 80, color: AppColors.baseWhite),
                );
              },
            ),
          ),
        ),
        FigmaBox(height: 24),
        // İsim
        Text("Balkan EVRENSEL", style: AppFonts.baseBold.copyWith(fontSize: 28, color: AppColors.baseWhite, height: 1.2, letterSpacing: 0.5)),
        FigmaBox(height: 12),
        // Unvan ve Şirket
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Kurucu", style: AppFonts.baseSemibold.copyWith(fontSize: 16, color: AppColors.baseWhite.withValues(alpha: 0.9))),
            Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.primary500.withValues(alpha: 0.6)),
            ),
            Text("ExpoNot", style: AppFonts.baseSemibold.copyWith(fontSize: 16, color: AppColors.baseWhite.withValues(alpha: 0.9))),
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
          border: Border.all(color: _isContactInfoExpanded ? Color(0xFF60A5FA).withValues(alpha: 0.3) : AppColors.baseWhite.withValues(alpha: 0.1), width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FigmaContainer(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFF60A5FA)),
                ),
                const SizedBox(width: 12),
                Text("İletişim Bilgileri", style: AppFonts.baseBold.copyWith(fontSize: 18, color: AppColors.baseWhite)),
                const Spacer(),
                AnimatedRotation(
                  duration: const Duration(milliseconds: 300),
                  turns: _isContactInfoExpanded ? 0.5 : 0,
                  child: Icon(Icons.keyboard_arrow_down, color: Color(0xFF60A5FA), size: 28),
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
                  _buildContactItem(
                    icon: Icons.email,
                    iconColor: Color(0xFF60A5FA),
                    label: "E-posta Adresi",
                    value: "balkan.evrensel@exponot.com",
                    onTap: () => _launchURL('mailto:balkan.evrensel@exponot.com'),
                  ),
                  FigmaBox(height: 20),
                  _buildContactItem(
                    icon: Icons.phone,
                    iconColor: Color(0xFF10B981),
                    label: "Telefon Numarası",
                    value: "0 (535) 508 4747",
                    onTap: () => _launchURL('tel:05355084747'),
                  ),
                  FigmaBox(height: 20),
                  _buildContactItem(
                    icon: Icons.language,
                    iconColor: Color(0xFF8B5CF6),
                    label: "Website",
                    value: "https://exponot.com/",
                    onTap: () => _launchURL('https://exponot.com'),
                  ),
                  FigmaBox(height: 20),
                  _buildContactItem(
                    icon: Icons.location_on,
                    iconColor: Color(0xFFF59E0B),
                    label: "Adres",
                    value: "Suadiye Mah. Bağdat Cad. Ark 399 No: 399 / 1. İç Kapı No: 1 34740 Kadıköy/İstanbul",
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
        crossAxisAlignment: isMultiline ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(color: iconColor.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppFonts.baseRegular.copyWith(fontSize: 13, color: AppColors.baseWhite.withValues(alpha: 0.6))),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: AppFonts.baseSemibold.copyWith(fontSize: 15, color: AppColors.baseWhite),
                  maxLines: isMultiline ? 3 : 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: AppColors.baseWhite.withValues(alpha: 0.4), size: 16),
        ],
      ),
    );
  }

  // Şirket Bağlantıları
  Widget _buildCompanyConnectionsSection() {
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
            colors: [Color(0xFF1E3A8A).withValues(alpha: 0.6), Color(0xFF1E293B).withValues(alpha: 0.4)],
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _isCompanyConnectionsExpanded ? Color(0xFFF59E0B).withValues(alpha: 0.4) : AppColors.baseWhite.withValues(alpha: 0.15),
            width: 1.5,
          ),
          boxShadow: [BoxShadow(color: Color(0xFF1E3A8A).withValues(alpha: 0.2), blurRadius: 20, offset: const Offset(0, 10))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Başlık
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Color(0xFFF59E0B).withValues(alpha: 0.2), borderRadius: BorderRadius.circular(10)),
                  child: Icon(Icons.business, color: Color(0xFFF59E0B), size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text("Şirket Bağlantıları", style: AppFonts.baseBold.copyWith(fontSize: 18, color: AppColors.baseWhite)),
                ),
                AnimatedRotation(
                  duration: const Duration(milliseconds: 300),
                  turns: _isCompanyConnectionsExpanded ? 0.5 : 0,
                  child: Icon(Icons.keyboard_arrow_down, color: Color(0xFFF59E0B), size: 28),
                ),
              ],
            ),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState: _isCompanyConnectionsExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              firstChild: const SizedBox(),
              secondChild: Column(
                children: [
                  FigmaBox(height: 24),

                  // Katalog Butonu
                  GestureDetector(
                    onTap: () => _launchURL('https://exponot.com/catalog'),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF2563EB)]),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Color(0xFF3B82F6).withValues(alpha: 0.4), blurRadius: 15, offset: const Offset(0, 8))],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(color: AppColors.baseWhite.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
                            child: Icon(Icons.menu_book_rounded, color: AppColors.baseWhite, size: 24),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Kataloğu İncele", style: AppFonts.baseBold.copyWith(fontSize: 16, color: AppColors.baseWhite)),
                                const SizedBox(height: 4),
                                Text(
                                  "Ürün ve hizmetlerimizi keşfedin",
                                  style: AppFonts.baseRegular.copyWith(fontSize: 13, color: AppColors.baseWhite.withValues(alpha: 0.85)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(color: AppColors.baseWhite.withValues(alpha: 0.2), shape: BoxShape.circle),
                            child: Icon(Icons.arrow_forward_ios, color: AppColors.baseWhite, size: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FigmaBox(height: 20),

                  // Divider
                  Row(
                    children: [
                      Expanded(child: Divider(color: AppColors.baseWhite.withValues(alpha: 0.2), thickness: 1)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text("Sosyal Medya", style: AppFonts.baseRegular.copyWith(fontSize: 12, color: AppColors.baseWhite.withValues(alpha: 0.6))),
                      ),
                      Expanded(child: Divider(color: AppColors.baseWhite.withValues(alpha: 0.2), thickness: 1)),
                    ],
                  ),
                  FigmaBox(height: 20),

                  // Sosyal Medya Butonları
                  Row(
                    children: [
                      Expanded(
                        child: _buildCompanySocialButton(icon: Icons.language, label: "Website", onTap: () => _launchURL('https://exponot.com')),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildCompanySocialButton(
                          icon: Icons.business_center,
                          label: "LinkedIn",
                          onTap: () => _launchURL('https://linkedin.com/company/exponot'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildCompanySocialButton(icon: Icons.camera_alt, label: "Instagram", onTap: () => _launchURL('https://instagram.com/exponot')),
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

  Widget _buildCompanySocialButton({required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.baseWhite.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.baseWhite.withValues(alpha: 0.15), width: 1),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: AppColors.baseWhite.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: AppColors.baseWhite, size: 24),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: AppFonts.baseRegular.copyWith(fontSize: 12, color: AppColors.baseWhite.withValues(alpha: 0.9)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Aksiyon Butonları
  Widget _buildActionButtons() {
    return Column(
      children: [
        // TODO: Rehbere ekle kismi qr ile uygulama acilinca rehbere ekle cikacak
        _buildActionButton(
          icon: Icons.qr_code,
          text: "Qr Kodunu Göster",
          backgroundColor: Color(0xFF3B82F6),
          textColor: AppColors.baseWhite,
          onTap: () {
            // Kartvizit paylaş
          },
        ),
        FigmaBox(height: 20),
        // TODO: Görüşme talepleri kısmında gorusme linkini google takvimler veya baska bir kullanilan takvim uygulamasina ekleyerek entegrasyonu tamamla. su sekilde olabilir takvime ekle dedikten sonra hangi takvim uygulamasina eklemek istediginizi secin google takvim outlook apple takvim gibi secenekler olsun ve secilen takvim uygulamasina gore gorusme talebi linki olusturup ekleyin.
        _buildActionButton(
          icon: Icons.calendar_today,
          text: "Görüşme Talebi",
          backgroundColor: Color(0xFFA855F7),
          textColor: AppColors.baseWhite,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MeetingRequestsView()),
            );
          },
        ),
        FigmaBox(height: 20),
        _buildActionButton(
          icon: Icons.download,
          text: "Kartvizit Paylas",
          backgroundColor: Color(0xFF1E293B),
          textColor: AppColors.baseWhite,
          onTap: () {
            // Rehbere ekle
          },
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
          gradient: LinearGradient(colors: [backgroundColor, backgroundColor.withValues(alpha: 0.8)]),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: backgroundColor.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 10))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: textColor, size: 24),
            const SizedBox(width: 12),
            Text(text, style: AppFonts.baseBold.copyWith(fontSize: 17, color: textColor, letterSpacing: 0.3)),
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
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Oturumu kapat'),
          content: const Text(
            'Bu cihazdaki aktif oturum kapatılacak. Devam etmek istiyor musunuz?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Vazgeç'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('Çıkış Yap'),
            ),
          ],
        );
      },
    );

    if (shouldLogout == true) {
      await AppSettings.instance.logout();
    }
  }
}
