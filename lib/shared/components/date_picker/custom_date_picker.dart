import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/extensions/integer.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';

class CustomDatePickerButton extends StatelessWidget {
  final String? title;
  final String? selectedDate;
  final VoidCallback? onTap;
  final String hintText;
  final IconData icon;

  const CustomDatePickerButton({
    super.key,
    this.title,
    this.selectedDate,
    this.onTap,
    this.hintText = 'Tarih Seç',
    this.icon = Icons.calendar_today,
  });

  bool get _isSelected => selectedDate != null;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12.pxv,
      children: [
        if (title != null)
          Text(
            title!,
            style: AppFonts.base2Semibold.withColor(AppColors.baseBlack),
          ),
        _buildPickerButton(),
      ],
    );
  }

  Widget _buildPickerButton() {
    return GestureDetector(
      onTap: onTap,
      child: FigmaContainer(
        padding: appSizer.paddingSymmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: _isSelected
              ? const Color(0xFF3B82F6).withAlpha(30)
              : AppColors.neutral100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isSelected
                ? AppColors.primary500.withValues(alpha: 0.5)
                : Colors.transparent,
            width: 1.19,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                selectedDate ?? hintText,
                style: appSizer.style(
                  color: _isSelected
                      ? AppColors.baseBlack
                      : AppColors.neutral500,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.23,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            FigmaBox(width: 8),
            Icon(icon, color: AppColors.neutral500, size: 16),
          ],
        ),
      ),
    );
  }
}
