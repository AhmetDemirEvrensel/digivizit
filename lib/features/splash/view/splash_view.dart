import 'dart:ui';

import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/constants/icon_paths.dart';
import 'package:digivizit/core/constants/image_paths.dart';
import 'package:digivizit/core/extensions/integer.dart';
import 'package:digivizit/core/utils/app_sizer.dart';
import 'package:digivizit/features/auth/index.dart';
import 'package:digivizit/features/splash/view_model/splash_view_model.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:flutter/material.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _iconScaleAnimation;
  late final Animation<double> _blurAnimation;
  final model = SplashViewModel();
  bool _textAnimationStarted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: SplashViewModelBase.animationDuration,
      vsync: this,
    );

    // Animasyonları view_model'den oluştur
    _iconScaleAnimation = model.createIconScaleAnimation(_controller);
    _blurAnimation = model.createBlurAnimation(_controller);

    // Animasyon bittiğinde login sayfasına git
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        model.onAnimationCompleted(mounted);
      }
    });

    // Splash başlatma
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Observer(
        builder: (_) {
          return SizedBox.expand(
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                // Arka plan resmi + Blur efekti
                AnimatedBuilder(
                  animation: _blurAnimation,
                  builder: (context, child) {
                    return ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: _blurAnimation.value,
                        sigmaY: _blurAnimation.value,
                        tileMode: TileMode.decal,
                      ),
                      child: Image.asset(
                        ImagePaths.authSplashBg,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    );
                  },
                ),

                // Icon ve Text - Ön planda
                SafeArea(
                  child: Center(
                    child: model.showContent
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon - sadece scale animasyonu
                              ScaleTransition(
                                scale: _iconScaleAnimation,
                                child: Image.asset(
                                  IconPaths.appIcon2,
                                  width: 300.pxh,
                                ),
                              ),
                              20.spacerV,
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                ),

                // Alt kısım: Asis Logo ve Şirket Adı - Ön planda
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 40,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Asis Logo - Animasyonlu
                      if (model.showContent)
                        TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 800),
                          tween: Tween(begin: 0.0, end: 1.0),
                          builder: (context, value, child) {
                            return Opacity(
                              opacity: value,
                              child: Transform.translate(
                                offset: Offset(0, 15 * (1 - value)),
                                child: Image.asset(
                                  ImagePaths.asisLogo,
                                  width: 65.pxh,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            );
                          },
                        ),
                      const FigmaBox(height: 12),
                      // Şirket Adı - İki satır animasyonlu
                      if (model.showContent)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildAnimatedText('Asis Otomasyon ve Akaryakıt'),
                            _buildAnimatedText('Sistemleri A.Ş.'),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnimatedText(String text) {
    // Text animasyonu başladığında blur'u tetikle
    if (!_textAnimationStarted) {
      _textAnimationStarted = true;
    }

    final textLength = text.length;
    return Wrap(
      alignment: WrapAlignment.center,
      children: List.generate(textLength, (index) {
        final delay = (index / textLength) * 0.7;
        final endTime = delay + 0.2;

        return TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 2500),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            final progress = ((value - delay) / (endTime - delay)).clamp(
              0.0,
              1.0,
            );

            return Opacity(
              opacity: progress,
              child: Transform.translate(
                offset: Offset(0, 8 * (1 - progress)),
                child: Text(
                  text[index],
                  style: appSizer.style(
                    color: AppColors.baseWhite,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    height: 1.30,
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
