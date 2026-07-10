import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/extensions/integer.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';

enum AlertContainerStatus { info, success, warning, error }

class CustomAlertContainer extends StatelessWidget {
  final String text;
  final AlertContainerStatus status;

  const CustomAlertContainer({
    super.key,
    required this.text,
    this.status = AlertContainerStatus.info,
  });

  Color get _accentColor => switch (status) {
    AlertContainerStatus.info => AppColors.primary600,
    AlertContainerStatus.success => AppColors.positive600,
    AlertContainerStatus.warning => AppColors.warning600,
    AlertContainerStatus.error => AppColors.negative500,
  };

  IconData get _icon => switch (status) {
    AlertContainerStatus.info => Icons.info_outline_rounded,
    AlertContainerStatus.success => Icons.check_circle_outline_rounded,
    AlertContainerStatus.warning => Icons.warning_amber_rounded,
    AlertContainerStatus.error => Icons.error_outline_rounded,
  };

  @override
  Widget build(BuildContext context) {
    return FigmaContainer(
      padding: appSizer.paddingSymmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: _accentColor.withValues(alpha: 0.08),
        border: Border.all(color: _accentColor.withValues(alpha: 0.22)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        spacing: 12.pxh,
        children: [
          Container(
            width: 38.pxh,
            height: 38.pxv,
            decoration: BoxDecoration(
              color: _accentColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(_icon, color: _accentColor, size: 21.pxv),
          ),
          Expanded(
            child: Text(
              text,
              style: AppFonts.baseSemibold.withColor(AppColors.ink),
            ),
          ),
        ],
      ),
    );
  }
}
