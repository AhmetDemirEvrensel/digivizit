import 'dart:ui';

import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/constants/image_paths.dart';
import 'package:digivizit/core/utils/app_sizer.dart';
import 'package:digivizit/features/splash/view_model/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _logoScaleAnimation;
  late final Animation<double> _blurAnimation;
  late final Animation<double> _contentOpacityAnimation;
  late final Animation<Offset> _contentSlideAnimation;

  final model = SplashViewModel();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: SplashViewModelBase.animationDuration,
      vsync: this,
    );

    _logoScaleAnimation = model.createIconScaleAnimation(_controller);
    _blurAnimation = model.createBlurAnimation(_controller);
    _contentOpacityAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.08, 1, curve: Curves.easeOut),
    );
    _contentSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.12, 1, curve: Curves.easeOutCubic),
          ),
        );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        model.onAnimationCompleted(mounted);
      }
    });

    model.init().then((_) {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appSizer = AppSizer.to;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FB),
        body: Observer(
          builder: (_) {
            return Stack(
              fit: StackFit.expand,
              children: [
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFFFFFFF),
                        Color(0xFFF8F9FB),
                        Color(0xFFEFF3F9),
                      ],
                    ),
                  ),
                ),
                _buildAmbientOrb(
                  alignment: Alignment.topLeft,
                  color: AppColors.primary300.withValues(alpha: 0.35),
                  size: 260,
                  offset: const Offset(-70, -80),
                ),
                _buildAmbientOrb(
                  alignment: Alignment.topRight,
                  color: AppColors.tertiary300.withValues(alpha: 0.25),
                  size: 220,
                  offset: const Offset(80, -30),
                ),
                _buildAmbientOrb(
                  alignment: Alignment.bottomCenter,
                  color: AppColors.info300.withValues(alpha: 0.22),
                  size: 320,
                  offset: const Offset(0, 140),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 28,
                    ),
                    child: Column(
                      children: [
                        const Spacer(),
                        if (model.showContent)
                          FadeTransition(
                            opacity: _contentOpacityAnimation,
                            child: SlideTransition(
                              position: _contentSlideAnimation,
                              child: Column(
                                children: [
                                  _buildTagChip(),
                                  const SizedBox(height: 18),
                                  ScaleTransition(
                                    scale: _logoScaleAnimation,
                                    child: _buildLogoPanel(),
                                  ),
                                  const SizedBox(height: 24),
                                  Text(
                                    'Kartvizit deneyimi hazırlanıyor',
                                    textAlign: TextAlign.center,
                                    style: AppFonts.xlSemibold.copyWith(
                                      color: AppColors.ink,
                                      letterSpacing: -0.4,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Bağlantılarınızı, QR paylaşımınızı ve dijital kartvizitinizi tek akışta yönetin.',
                                    textAlign: TextAlign.center,
                                    style: AppFonts.baseRegular.copyWith(
                                      color: AppColors.inkSoft,
                                      height: 1.55,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        const Spacer(),
                        if (model.showContent)
                          FadeTransition(
                            opacity: _contentOpacityAnimation,
                            child: Column(
                              children: [
                                _buildLoadingBar(),
                                const SizedBox(height: 14),
                                Text(
                                  'Sistem hazırlanıyor',
                                  style: AppFonts.smSemibold.copyWith(
                                    color: AppColors.inkFaint,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildAmbientOrb({
    required Alignment alignment,
    required Color color,
    required double size,
    Offset offset = Offset.zero,
  }) {
    return Align(
      alignment: alignment,
      child: Transform.translate(
        offset: offset,
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: 36 + (_blurAnimation.value * 6),
            sigmaY: 36 + (_blurAnimation.value * 6),
          ),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
        ),
      ),
    );
  }

  Widget _buildTagChip() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.baseWhite,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.hairline),
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        'HEPTA DIGITAL BUSINESS CARD',
        style: AppFonts.smBold.copyWith(
          color: AppColors.primary600,
          letterSpacing: 1.1,
        ),
      ),
    );
  }

  Widget _buildLogoPanel() {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 320),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        border: Border.all(color: AppColors.hairline),
        color: AppColors.baseWhite,
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withValues(alpha: 0.08),
            blurRadius: 34,
            offset: const Offset(0, 18),
          ),
          BoxShadow(
            color: AppColors.primary500.withValues(alpha: 0.08),
            blurRadius: 60,
            offset: const Offset(0, 26),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            decoration: BoxDecoration(
              color: AppColors.surfaceAlt,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Image.asset(
              ImagePaths.logo,
              fit: BoxFit.contain,
              height: 72,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: AppColors.surfaceAlt,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.tertiary300,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.tertiary300.withValues(alpha: 0.45),
                      blurRadius: 12,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: AppColors.surfaceAlt,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingBar() {
    return Container(
      width: 146,
      height: 6,
      decoration: BoxDecoration(
        color: AppColors.surfaceAlt,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: 0.28 + (_controller.value * 0.62),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [AppColors.primary400, AppColors.tertiary300],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
