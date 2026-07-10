import 'dart:math' as math;

import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/shared/components/hexagon/hexagon_widget.dart';
import 'package:digivizit/shared/components/loader/shimmer_box.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// Blinq-esinli 3D çevrilebilir dijital kartvizit.
///
/// Ön yüz: marka bantlı, altıgen filigranlı kartvizit.
/// Arka yüz: lokalde çizilen QR kod. Karta dokununca Y ekseninde
/// perspektifli flip animasyonuyla yüzler değişir.
class FlippableBusinessCard extends StatefulWidget {
  final String name;
  final String? title;
  final String? company;
  final String? email;
  final String? phone;
  final String? photoUrl;

  /// QR'ın kodlayacağı bağlantı. Null ise arka yüzde shimmer gösterilir
  /// ve kart çevrilebilir ama QR "hazırlanıyor" durumunda kalır.
  final String? qrData;

  const FlippableBusinessCard({
    super.key,
    required this.name,
    this.title,
    this.company,
    this.email,
    this.phone,
    this.photoUrl,
    this.qrData,
  });

  @override
  State<FlippableBusinessCard> createState() => _FlippableBusinessCardState();
}

class _FlippableBusinessCardState extends State<FlippableBusinessCard>
    with SingleTickerProviderStateMixin {
  static const _cardRadius = 24.0;

  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 650),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flip() {
    if (_controller.isAnimating) return;
    if (_controller.value < 0.5) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flip,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final angle = _animation.value * math.pi;
          final showBack = angle > math.pi / 2;

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            child: showBack
                ? Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(math.pi),
                    child: _buildBackFace(),
                  )
                : _buildFrontFace(),
          );
        },
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: AppColors.baseWhite,
      borderRadius: BorderRadius.circular(_cardRadius),
      border: Border.all(color: const Color(0xFFE8ECF3)),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF0F172A).withValues(alpha: 0.10),
          blurRadius: 30,
          offset: const Offset(0, 16),
        ),
        BoxShadow(
          color: AppColors.primary500.withValues(alpha: 0.06),
          blurRadius: 60,
          offset: const Offset(0, 24),
        ),
      ],
    );
  }

  Widget _buildFrontFace() {
    return Container(
      width: double.infinity,
      decoration: _cardDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_cardRadius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBrandBand(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: const Offset(0, -34),
                    child: _buildAvatar(),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: AppFonts.xl2Bold.withColor(
                            const Color(0xFF0F172A),
                          ),
                        ),
                        const SizedBox(height: 4),
                        if ((widget.title?.trim().isNotEmpty ?? false))
                          Text(
                            widget.title!.trim(),
                            style: AppFonts.base2Regular.withColor(
                              const Color(0xFF64748B),
                            ),
                          ),
                        
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.qr_code_2_rounded,
                            size: 20,
                            color: AppColors.primary500.withValues(alpha: 0.8),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'QR için dokun',
                            style: AppFonts.baseSemibold.withColor(
                              const Color(0xFF94A3B8),
                            ),
                          ),
                        ],
                      ),
                      HexagonWidget(
                        size: 22,
                        fillColor: AppColors.primary500.withValues(alpha: 0.10),
                        borderColor: AppColors.primary500.withValues(
                          alpha: 0.35,
                        ),
                        borderWidth: 1.2,
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

  Widget _buildBrandBand() {
    return SizedBox(
      height: 92,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.primary600, AppColors.primary400],
              ),
            ),
          ),
          // Silik altıgen filigranlar — marka esamesi
          Positioned(
            right: -18,
            top: -20,
            child: HexagonWidget(
              size: 110,
              fillColor: AppColors.baseWhite.withValues(alpha: 0.08),
            ),
          ),
          Positioned(
            right: 64,
            bottom: -34,
            child: HexagonWidget(
              size: 76,
              fillColor: AppColors.baseWhite.withValues(alpha: 0.06),
            ),
          ),
          if ((widget.company?.trim().isNotEmpty ?? false))
            Positioned(
              left: 20,
              top: 20,
              child: Text(
                widget.company!.trim().toUpperCase(),
                style: AppFonts.smBold
                    .withColor(AppColors.baseWhite.withValues(alpha: 0.92))
                    .withLetterSpacing(2.2),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    final photo = widget.photoUrl?.trim() ?? '';

    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.baseWhite,
        border: Border.all(color: AppColors.baseWhite, width: 4),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.14),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipOval(
        child: photo.isNotEmpty
            ? Image.network(
                photo,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const ShimmerBox(
                    borderRadius: BorderRadius.all(Radius.circular(34)),
                  );
                },
                errorBuilder: (context, error, stackTrace) =>
                    _buildInitialsAvatar(),
              )
            : _buildInitialsAvatar(),
      ),
    );
  }

  Widget _buildInitialsAvatar() {
    final parts = widget.name
        .trim()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .toList();
    final initials = parts.isEmpty
        ? '?'
        : parts.length == 1
        ? parts.first[0].toUpperCase()
        : '${parts.first[0]}${parts.last[0]}'.toUpperCase();

    return Container(
      color: AppColors.primary100,
      alignment: Alignment.center,
      child: Text(
        initials,
        style: AppFonts.lg2Bold.withColor(AppColors.primary600),
      ),
    );
  }

  Widget _buildContactChips() {
    final chips = <Widget>[
      if ((widget.phone?.trim().isNotEmpty ?? false))
        _buildChip(Icons.phone_rounded, widget.phone!.trim()),
      if ((widget.email?.trim().isNotEmpty ?? false))
        _buildChip(Icons.email_rounded, widget.email!.trim()),
    ];

    if (chips.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var index = 0; index < chips.length; index++) ...[
          chips[index],
          if (index != chips.length - 1) const SizedBox(height: 8),
        ],
      ],
    );
  }

  Widget _buildChip(IconData icon, String label) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.primary500.withValues(alpha: 0.11),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: AppColors.primary600),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppFonts.base2Semibold.withColor(const Color(0xFF334155)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackFace() {
    final qrData = widget.qrData?.trim();

    return Container(
      width: double.infinity,
      decoration: _cardDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dijital Kartvizitim',
                style: AppFonts.baseBold.withColor(const Color(0xFF0F172A)),
              ),
              HexagonWidget(
                size: 24,
                gradientColors: const [
                  AppColors.primary600,
                  AppColors.primary400,
                ],
              ),
            ],
          ),
          const SizedBox(height: 18),
          if (qrData != null && qrData.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.baseWhite,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: QrImageView(
                data: qrData,
                version: QrVersions.auto,
                size: 190,
                eyeStyle: const QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: Color(0xFF0F172A),
                ),
                dataModuleStyle: const QrDataModuleStyle(
                  dataModuleShape: QrDataModuleShape.square,
                  color: Color(0xFF0F172A),
                ),
              ),
            )
          else
            const ShimmerBox(
              width: 218,
              height: 218,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          const SizedBox(height: 16),
          Text(
            qrData != null && qrData.isNotEmpty
                ? 'Paylaşmak için okutun'
                : 'QR hazırlanıyor...',
            style: AppFonts.smSemibold.withColor(const Color(0xFF64748B)),
          ),
          const SizedBox(height: 6),
          Text(
            'Kartına dönmek için dokun',
            style: AppFonts.xsRegular.withColor(const Color(0xFF94A3B8)),
          ),
        ],
      ),
    );
  }
}
