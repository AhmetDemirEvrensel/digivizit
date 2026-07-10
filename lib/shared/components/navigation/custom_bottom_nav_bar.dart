import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/shared/components/buttons/pressable_scale.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const _items = <_NavigationItem>[
    _NavigationItem(icon: Icons.badge_rounded, label: 'Kartım'),
    _NavigationItem(icon: Icons.document_scanner_rounded, label: 'Tara'),
    _NavigationItem(icon: Icons.people_rounded, label: 'Bağlantılar'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Container(
        height: 76,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.baseWhite,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.hairline),
          boxShadow: [
            BoxShadow(
              color: AppColors.ink.withValues(alpha: 0.10),
              blurRadius: 28,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: List.generate(
            _items.length,
            (index) => Expanded(
              child: _buildNavigationItem(
                item: _items[index],
                index: index,
                isActive: currentIndex == index,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationItem({
    required _NavigationItem item,
    required int index,
    required bool isActive,
  }) {
    final isScanAction = index == 1;

    return Semantics(
      selected: isActive,
      button: true,
      label: item.label,
      child: PressableScale(
        onTap: () => onTap(index),
        pressedScale: 0.96,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          height: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.primary500.withValues(
                    alpha: isScanAction ? 1 : 0.10,
                  )
                : Colors.transparent,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedScale(
                scale: isActive ? 1.05 : 1,
                duration: const Duration(milliseconds: 220),
                child: Icon(
                  item.icon,
                  size: 23,
                  color: isActive && isScanAction
                      ? AppColors.baseWhite
                      : isActive
                      ? AppColors.primary600
                      : AppColors.inkFaint,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 220),
                style: AppFonts.xsSemibold.copyWith(
                  color: isActive && isScanAction
                      ? AppColors.baseWhite
                      : isActive
                      ? AppColors.primary600
                      : AppColors.inkSoft,
                ),
                child: Text(item.label, maxLines: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationItem {
  final IconData icon;
  final String label;

  const _NavigationItem({required this.icon, required this.label});
}
