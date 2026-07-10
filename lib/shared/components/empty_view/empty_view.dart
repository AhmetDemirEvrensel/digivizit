import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/extensions/integer.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';

class EmptyView extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  const EmptyView({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: appSizer.paddingAll(20),
        child: FigmaContainer(
          padding: appSizer.paddingAll(20),
          decoration: BoxDecoration(
            color: AppColors.baseWhite.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 64,
                color: AppColors.baseWhite.withValues(alpha: 0.7),
              ),
              20.spacerV,
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppFonts.lg2Semibold.withColor(AppColors.baseWhite),
              ),
              10.spacerV,
              Text(
                description,
                textAlign: TextAlign.center,
                style: AppFonts.base2Semibold.withColor(
                  AppColors.baseWhite.withValues(alpha: 0.7),
                ),
              ),
              20.spacerV,
            ],
          ),
        ),
      ),
    );
  }
}
