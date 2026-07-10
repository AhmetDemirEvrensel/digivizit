import 'dart:ui';

import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/shared/components/loader/hexagon_loader2.dart';
import 'package:flutter/material.dart';

class AsyncProcessLoader extends StatelessWidget {
  const AsyncProcessLoader({super.key});
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.surface.withValues(alpha: 0.55),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
            decoration: BoxDecoration(
              color: AppColors.baseWhite,
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: AppColors.hairline),
              boxShadow: [
                BoxShadow(
                  color: AppColors.ink.withValues(alpha: 0.10),
                  blurRadius: 40,
                  offset: const Offset(0, 18),
                ),
              ],
            ),
            child: const HexagonLoaderScreen2(size: 150),
          ),
        ),
      ),
    );
  }
}
