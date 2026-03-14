import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FigmaContainer(
      height: 90,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1E293B).withValues(alpha: 0.95),
            Color(0xFF0F172A).withValues(alpha: 0.98),
          ],
        ),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        border: Border(
          top: BorderSide(
            color: AppColors.baseWhite.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.baseBlack.withValues(alpha: 0.3),
            blurRadius: 30,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Nav Items
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Sol - Kişiler (Peoples)
                _buildNavItem(
                  index: 0,
                  icon: Icons.badge_rounded,

                  isActive: currentIndex == 0,
                ),

                // Ortada boşluk (büyük buton için)
                const FigmaBox(width: 80),

                // Sağ - Ayarlar
                _buildNavItem(
                  index: 2,
                  icon: Icons.people_rounded,

                  isActive: currentIndex == 2,
                ),
              ],
            ),
          ),

          // Ortadaki Büyük Home Butonu
          Positioned(
            top: -20,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () => onTap(1),
                child: FigmaContainer(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: currentIndex == 1
                          ? [Color(0xFF3B82F6), Color(0xFF2563EB)]
                          : [Color(0xFF1E3A8A), Color(0xFF1E293B)],
                    ),
                    border: Border.all(color: Color(0xFF0F172A), width: 6),
                    boxShadow: [
                      BoxShadow(
                        color:
                            (currentIndex == 1
                                    ? Color(0xFF3B82F6)
                                    : Color(0xFF1E3A8A))
                                .withValues(alpha: 0.5),
                        blurRadius: 25,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.document_scanner_outlined,
                    color: AppColors.baseWhite,
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.translucent,
      child: FigmaContainer(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // İkon Container
            FigmaContainer(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isActive
                    ? Color(0xFF3B82F6).withValues(alpha: 0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                icon,
                color: isActive
                    ? Color(0xFF3B82F6)
                    : AppColors.baseWhite.withValues(alpha: 0.5),
                size: 30,
              ),
            ),

            // Aktif indicator
            if (isActive)
              FigmaContainer(
                margin: const EdgeInsets.only(top: 4),
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF3B82F6),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF3B82F6).withValues(alpha: 0.5),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
