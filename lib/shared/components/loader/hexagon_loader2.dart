import 'dart:async';

import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';
import 'package:digivizit/shared/components/hexagon/hexagon_widget.dart';

class HexagonLoaderScreen2 extends StatefulWidget {
  const HexagonLoaderScreen2({
    super.key,
    this.size = 200,
    this.animationSpeed = const Duration(milliseconds: 600),
    this.pauseDuration = const Duration(milliseconds: 400),
  });

  /// Total width of the container
  final double size;

  /// Speed of the jump animation
  final Duration animationSpeed;

  /// Duration to pause between jumps
  final Duration pauseDuration;

  @override
  State<HexagonLoaderScreen2> createState() => _HexagonLoaderScreen2State();
}

class _HexagonLoaderScreen2State extends State<HexagonLoaderScreen2> {
  // Initial order of colors based on the image
  // 0: Primary (Blue), 1: Tertiary (Dark Blue), 2: Secondary (Red), 3: Grey (Grey)
  final List<Color> _colors = [
    AppColors.primary500,
    AppColors.tertiary500,
    AppColors.secondary500,
    AppColors.greyText,
  ];

  // Current slot assignments for each color index
  // colorOrder[0] is the color index at slot 0
  late List<int> _colorOrder;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _colorOrder = [0, 1, 2, 3];
    _startAnimation();
  }

  void _startAnimation() {
    // İlk animasyonu hemen başlat
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          final last = _colorOrder.removeLast();
          _colorOrder.insert(0, last);
        });
      }
    });

    // Sonraki animasyonları periyodik olarak çalıştır
    _timer = Timer.periodic(widget.animationSpeed + widget.pauseDuration, (
      timer,
    ) {
      if (mounted) {
        setState(() {
          final last = _colorOrder.removeLast();
          _colorOrder.insert(0, last);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hexSize = widget.size / 5;
    final spacing = hexSize * 0.4;
    final totalWidth = (hexSize * 4) + (spacing * 3);
    final containerWidth =
        totalWidth +
        (hexSize * 0.8); // Added extra width for jump space and glow

    return Center(
      child: FigmaBox(
        width: containerWidth,
        height: hexSize * 2.0, // Increased height for glow
        child: Stack(
          alignment: Alignment.centerLeft,
          clipBehavior: Clip.none, // Prevent clipping during jump
          children: [
            // Static Connection Bars
            ...List.generate(
              3,
              (i) => _buildConnectionBar(
                i,
                hexSize,
                spacing,
                offset: hexSize * 0.4,
              ),
            ),

            // Animated Hexagons
            ...List.generate(4, (colorIndex) {
              final currentSlot = _colorOrder.indexOf(colorIndex);
              return _buildAnimatedHexagon(
                colorIndex: colorIndex,
                slot: currentSlot,
                hexSize: hexSize,
                spacing: spacing,
                offset: hexSize * 0.4,
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildConnectionBar(
    int index,
    double hexSize,
    double spacing, {
    required double offset,
  }) {
    final x = offset + (hexSize / 2) + (index * (hexSize + spacing));
    return Positioned(
      left: x,
      child: FigmaBox(
        width: hexSize + spacing,
        height: spacing * 0.8,
        child: Center(
          child: FigmaBox(
            width: spacing * 1.2,
            height: spacing * 0.6,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Horizontal line
                FigmaContainer(
                  width: double.infinity,
                  height: 2,
                  decoration: BoxDecoration(
                    color: const Color(0xFFCBD5E1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                // Left vertical bar
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: FigmaContainer(
                    width: 2,
                    decoration: BoxDecoration(
                      color: const Color(0xFFCBD5E1),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                // Right vertical bar
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: FigmaContainer(
                    width: 2,
                    decoration: BoxDecoration(
                      color: const Color(0xFFCBD5E1),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedHexagon({
    required int colorIndex,
    required int slot,
    required double hexSize,
    required double spacing,
    required double offset,
  }) {
    final x = offset + (slot * (hexSize + spacing));
    final color = _colors[colorIndex];

    return AnimatedPositioned(
      duration: widget.animationSpeed,
      curve: Curves.easeInOutBack,
      left: x,
      top: (hexSize * 0.5), // Adjusted for height increase
      child: FigmaContainer(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
        child: HexagonWidget(
          size: hexSize,
          fillColor: color,
          borderColor: Colors.white,
          borderWidth: 0.8,
          cornerRadius: hexSize * 0.1,
        ),
      ),
    );
  }
}
