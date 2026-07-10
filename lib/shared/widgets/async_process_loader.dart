import 'dart:ui';

import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/shared/components/loader/app_loader_indicator.dart';
import 'package:flutter/material.dart';

class AsyncProcessLoader extends StatelessWidget {
  const AsyncProcessLoader({super.key});
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Yükleniyor',
      liveRegion: true,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: ColoredBox(
          color: AppColors.ink.withValues(alpha: 0.14),
          child: Center(
            child: Container(
              width: 210,
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.baseWhite, Color(0xFFF5F9FF)],
                ),
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: AppColors.primary100),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.ink.withValues(alpha: 0.12),
                    blurRadius: 38,
                    offset: const Offset(0, 18),
                  ),
                  BoxShadow(
                    color: AppColors.primary500.withValues(alpha: 0.10),
                    blurRadius: 32,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AppLoaderIndicator(),
                  const SizedBox(height: 16),
                  Text(
                    'İşlem sürüyor',
                    textAlign: TextAlign.center,
                    style: AppFonts.lgBold.withColor(AppColors.ink),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Lütfen kısa bir süre bekleyin',
                    textAlign: TextAlign.center,
                    style: AppFonts.smRegular.withColor(AppColors.inkSoft),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
