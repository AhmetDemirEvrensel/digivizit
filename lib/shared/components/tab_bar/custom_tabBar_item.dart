import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/extensions/integer.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';

enum CustomTabBarItemType { icon, text }

class CustomTabbarItem extends StatelessWidget {
  final String? label;
  final bool? isSelected;
  final String? iconPath;
  final VoidCallback? onTap;
  final CustomTabBarItemType type;

  const CustomTabbarItem._({super.key, this.label, this.isSelected, this.iconPath, this.onTap, required this.type});

  factory CustomTabbarItem.icon({Key? key, required String label, required String iconPath, bool? isSelected, VoidCallback? onTap}) {
    return CustomTabbarItem._(key: key, label: label, iconPath: iconPath, isSelected: isSelected, onTap: onTap, type: CustomTabBarItemType.icon);
  }

  factory CustomTabbarItem.text({Key? key, required String label, bool? isSelected, VoidCallback? onTap}) {
    return CustomTabbarItem._(key: key, label: label, isSelected: isSelected, onTap: onTap, type: CustomTabBarItemType.text);
  }

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      CustomTabBarItemType.icon => _buildIconTabBarItem(),
      CustomTabBarItemType.text => _buildTextTabBarItem(),
    };
  }

  Widget _buildIconTabBarItem() {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              if (isSelected ?? false)
                FigmaContainer(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(colors: [Colors.white.withValues(alpha: 0.25), Colors.white.withValues(alpha: 0.08), Colors.transparent]),
                  ),
                ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: 44.pxh,
                height: 44.pxv,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: isSelected ?? false ? Colors.white.withValues(alpha: 0.15) : Colors.transparent,
                  border: isSelected ?? false ? Border.all(width: 1.15, color: Colors.white.withValues(alpha: 0.30)) : null,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: iconPath != null
                    ? Image.asset(iconPath!, width: 22.pxh, height: 22.pxh, color: isSelected ?? false ? Colors.white : Colors.white.withValues(alpha: 0.60))
                    : null,
              ),
            ],
          ),
          FigmaBox(height: 4),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            style: AppFonts.smBold.copyWith(color: isSelected ?? false ? Colors.white : Colors.white.withValues(alpha: 0.60), letterSpacing: -0.20),
            child: Text(label ?? '', textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }

  Widget _buildTextTabBarItem() {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              if (isSelected ?? false)
                FigmaContainer(
                  height: 44.pxv,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(colors: [Colors.white.withValues(alpha: 0.25), Colors.white.withValues(alpha: 0.08), Colors.transparent]),
                  ),
                ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: 44.pxv,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ?? false ? Colors.white.withValues(alpha: 0.15) : Colors.transparent,
                  border: isSelected ?? false ? Border.all(width: 1.15, color: Colors.white.withValues(alpha: 0.30)) : null,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  label ?? '',
                  style: AppFonts.baseBold.copyWith(color: isSelected ?? false ? Colors.white : Colors.white.withValues(alpha: 0.60), letterSpacing: -0.10),
                ),
              ),
            ],
          ),
          FigmaBox(height: 4),
        ],
      ),
    );
  }
}
