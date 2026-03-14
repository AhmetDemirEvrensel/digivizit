import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/extensions/integer.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';

class CustomAlertContainer extends StatelessWidget {
  final String text;
  const CustomAlertContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return FigmaContainer(
      padding: appSizer.paddingSymmetric(horizontal: 16, vertical: 12),
      decoration: ShapeDecoration(
        color: AppColors.tertiary500.withValues(alpha: 0.5),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.15, color: Colors.white.withValues(alpha: 0.30)),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Row(
        spacing: 12.pxh,
        children: [
          Icon(Icons.info_outline, color: AppColors.baseWhite, size: 30.pxv),
          Expanded(child: Text(text, style: AppFonts.baseSemibold.withColor(AppColors.baseWhite))),
        ],
      ),
    );
  }
}
