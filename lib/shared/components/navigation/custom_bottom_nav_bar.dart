import 'dart:ui';

import 'package:digivizit/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  static const _inkSoft = Color(0xFF94A3B8);
  static const _hairline = Color(0xFFE2E8F0);

  bool _fabPressed = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      // Buzlu-beyaz bar: extendBody nedeniyle koyu kamera görünümü
      // üstünde de okunabilir kalması için blur + yarı saydam beyaz.
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: AppColors.baseWhite.withValues(alpha: 0.85),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
            border: const Border(top: BorderSide(color: _hairline, width: 1)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF0F172A).withValues(alpha: 0.08),
                blurRadius: 30,
                offset: const Offset(0, -8),
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildNavItem(
                      index: 0,
                      icon: Icons.badge_rounded,
                      label: 'Kartım',
                    ),
                    const SizedBox(width: 80),
                    _buildNavItem(
                      index: 2,
                      icon: Icons.people_rounded,
                      label: 'Bağlantılar',
                    ),
                  ],
                ),
              ),

              // Ortadaki tarama butonu
              Positioned(
                top: -22,
                left: 0,
                right: 0,
                child: Center(
                  child: GestureDetector(
                    onTapDown: (_) => setState(() => _fabPressed = true),
                    onTapUp: (_) => setState(() => _fabPressed = false),
                    onTapCancel: () => setState(() => _fabPressed = false),
                    onTap: () => widget.onTap(1),
                    child: AnimatedScale(
                      scale: _fabPressed ? 0.9 : 1.0,
                      duration: const Duration(milliseconds: 130),
                      curve: Curves.easeOut,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                        width: 84,
                        height: 84,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: widget.currentIndex == 1
                                ? [AppColors.primary500, AppColors.primary700]
                                : [AppColors.primary400, AppColors.primary600],
                          ),
                          border: Border.all(
                            color: AppColors.baseWhite,
                            width: 6,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary500.withValues(
                                alpha: widget.currentIndex == 1 ? 0.45 : 0.3,
                              ),
                              blurRadius: 24,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.document_scanner_outlined,
                          color: AppColors.baseWhite,
                          size: 34,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final isActive = widget.currentIndex == index;

    return GestureDetector(
      onTap: () => widget.onTap(index),
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeOutBack,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.primary500.withValues(alpha: 0.12)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(999),
              ),
              child: AnimatedScale(
                scale: isActive ? 1.12 : 1.0,
                duration: const Duration(milliseconds: 280),
                curve: Curves.easeOutBack,
                child: Icon(
                  icon,
                  color: isActive ? AppColors.primary600 : _inkSoft,
                  size: 27,
                ),
              ),
            ),
            const SizedBox(height: 3),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 250),
              style: TextStyle(
                fontSize: 11,
                fontFamily: 'Inter',
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                color: isActive ? AppColors.primary600 : _inkSoft,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
