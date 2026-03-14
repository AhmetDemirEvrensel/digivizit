import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/extensions/integer.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';

class CustomDropdownButton extends StatelessWidget {
  final String contentText;
  final bool isSelected;
  final bool isExpanded;
  final List<String> items;
  final VoidCallback onTap;
  final Function(String) onItemTap;

  final String? title;

  const CustomDropdownButton({
    super.key,
    required this.contentText,
    this.isSelected = false,
    required this.isExpanded,
    required this.items,
    required this.onTap,
    required this.onItemTap,
    this.title,
  });

  bool get _showSearch => items.length > 5;

  double _calculateDropdownHeight(int itemCount) {
    const double itemHeight = 47;
    const double separatorHeight = 1.19;
    const double searchBarHeight = 56;
    const double emptyStateHeight = 80;
    const double maxHeight = 280.0;

    double calculatedHeight;

    if (itemCount == 0) {
      calculatedHeight = emptyStateHeight;
    } else {
      calculatedHeight = (itemCount * itemHeight) + ((itemCount - 1) * separatorHeight);
    }

    if (_showSearch) {
      calculatedHeight += searchBarHeight;
    }

    return calculatedHeight > maxHeight ? maxHeight : calculatedHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) Text(title!, style: AppFonts.base2Semibold.withColor(AppColors.baseBlack)),
        10.spacerV,
        // Dropdown Button
        GestureDetector(
          onTap: onTap,
          child: FigmaContainer(
            width: double.infinity,
            padding: appSizer.paddingSymmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.neutral100,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.transparent, width: 1.19),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FigmaBox(width: 203, child: Text(contentText, style: AppFonts.base2Semibold.withColor(AppColors.baseBlack))),
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(Icons.keyboard_arrow_down_rounded, color: const Color(0xFF99A1AE), size: 24),
                ),
              ],
            ),
          ),
        ),
        10.spacerV,
        // Dropdown List
        AnimatedSize(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut, child: isExpanded ? _buildExpandedList() : const SizedBox.shrink()),
      ],
    );
  }

  Widget _buildExpandedList() {
    return FigmaContainer(
      height: _calculateDropdownHeight(items.length),
      decoration: BoxDecoration(
        color: const Color(0x99F3F4F6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xCCE5E7EB), width: 1.19),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(children: [Expanded(child: _buildItemList())]),
      ),
    );
  }

  Widget _buildItemList() {
    if (items.isEmpty) {
      return Center(
        child: Padding(
          padding: appSizer.paddingAll(16),
          child: Text(
            'reports.vehicle_not_found'.tr,
            textAlign: TextAlign.center,
            style: appSizer.style(color: const Color(0xFF99A1AE), fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (context, index) => Divider(height: 1, thickness: 1.19, color: const Color(0x7FE5E7EB), indent: 0, endIndent: 0),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => onItemTap(items[index]),
          child: FigmaContainer(
            padding: appSizer.paddingSymmetric(horizontal: 16, vertical: 14),
            child: Text(
              items[index],
              style: appSizer.style(color: const Color(0xFF374151), fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: -0.23),
            ),
          ),
        );
      },
    );
  }
}
