import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';

/// A multi-purpose hexagon widget that can be used as:
/// - A checkbox with checked/unchecked states
/// - An icon container
/// - A simple decorative hexagon
class HexagonWidget extends StatelessWidget {
  final double size;
  final Color? fillColor;
  final List<Color>? gradientColors;
  final Color? borderColor;
  final double borderWidth;
  final double cornerRadius;
  final Widget? child;
  final VoidCallback? onTap;
  final List<BoxShadow>? boxShadow;
  final bool rotate;

  const HexagonWidget({
    super.key,
    required this.size,
    this.fillColor,
    this.gradientColors,
    this.borderColor,
    this.borderWidth = 1.5,
    this.cornerRadius = 3.0,
    this.child,
    this.onTap,
    this.boxShadow,
    this.rotate = false,
  });

  /// Factory constructor for checkbox mode
  /// If checkColor is not provided, the check icon will be transparent (showing background)
  factory HexagonWidget.checkbox({
    Key? key,
    double size = 24,
    required bool isChecked,
    VoidCallback? onChanged,
    Color? checkedColor,
    Color? uncheckedColor,
    Color? borderColor,
    Color? checkColor,
    List<Color>? gradientColors,
    double cornerRadius = 3.0,
    bool rotate = false,
  }) {
    return HexagonWidget(
      key: key,
      size: size,
      fillColor: isChecked
          ? (checkedColor ?? AppColors.primary500)
          : uncheckedColor,
      gradientColors: isChecked ? gradientColors : null,
      borderColor: borderColor ?? AppColors.neutral300,
      borderWidth: 1.5,
      cornerRadius: cornerRadius,
      onTap: onChanged,
      rotate: rotate,
      child: isChecked
          ? Icon(
              Icons.check,
              size: size * 0.55,
              color: checkColor, // null = transparent, shows background
            )
          : null,
    );
  }

  /// Factory constructor for asset icon mode
  /// Takes an icon path string (e.g., IconPaths.xxx) and renders it as Image.asset
  factory HexagonWidget.assetIcon({
    Key? key,
    double size = 32,
    required String iconPath,
    Color? fillColor,
    Color? borderColor,
    Color? iconColor,
    double? iconSize,
    double cornerRadius = 3.0,
    VoidCallback? onTap,
    List<BoxShadow>? boxShadow,
    bool rotate = false,
  }) {
    final effectiveIconSize = iconSize ?? size * 0.5;
    return HexagonWidget(
      key: key,
      size: size,
      fillColor: fillColor ?? AppColors.primary500,
      borderColor: borderColor,
      borderWidth: 1.5,
      cornerRadius: cornerRadius,
      onTap: onTap,
      boxShadow: boxShadow,
      rotate: rotate,
      child: Image.asset(
        iconPath,
        width: effectiveIconSize,
        height: effectiveIconSize,
        color: iconColor,
      ),
    );
  }

  /// Factory constructor for icon mode
  /// If iconColor is not provided, the icon will be transparent (showing background)
  factory HexagonWidget.icon({
    Key? key,
    double size = 32,
    required IconData icon,
    Color? fillColor,
    List<Color>? gradientColors,
    Color? borderColor,
    Color? iconColor,
    double? iconSize,
    double? borderWidth,
    double cornerRadius = 3.0,
    VoidCallback? onTap,
    List<BoxShadow>? boxShadow,
    bool rotate = false,
  }) {
    return HexagonWidget(
      key: key,
      size: size,
      fillColor:
          fillColor ?? (gradientColors == null ? AppColors.primary500 : null),
      gradientColors: fillColor != null ? null : gradientColors,
      borderColor: borderColor,
      borderWidth: borderWidth ?? 1.15,
      cornerRadius: cornerRadius,
      onTap: onTap,
      boxShadow: boxShadow,
      rotate: rotate,
      child: Icon(
        icon,
        size: iconSize ?? size * 0.5,
        color: iconColor, // null = transparent, shows background
      ),
    );
  }

  /// Factory constructor for custom child widget
  factory HexagonWidget.custom({
    Key? key,
    double size = 32,
    required Widget child,
    Color? fillColor,
    List<Color>? gradientColors,
    Color? borderColor,
    double borderWidth = 1.5,
    double cornerRadius = 3.0,
    VoidCallback? onTap,
    List<BoxShadow>? boxShadow,
    bool rotate = false,
  }) {
    return HexagonWidget(
      key: key,
      size: size,
      fillColor: fillColor,
      gradientColors: gradientColors,
      boxShadow: boxShadow,
      borderColor: borderColor,
      borderWidth: borderWidth,
      cornerRadius: cornerRadius,
      onTap: onTap,
      rotate: rotate,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final hexagon = CustomPaint(
      size: Size(size, size),
      painter: _HexagonPainter(
        fillColor: fillColor,
        gradient: gradientColors == null
            ? null
            : LinearGradient(colors: gradientColors!),
        borderColor: borderColor,
        borderWidth: borderWidth,
        cornerRadius: cornerRadius,
        rotate: rotate,
      ),
      child: FigmaBox(
        width: size,
        height: size,
        child: Center(child: child),
      ),
    );

    Widget result = hexagon;

    // Wrap with Container if boxShadow is provided
    if (boxShadow != null) {
      result = Container(
        width: size,
        height: size,
        decoration: BoxDecoration(boxShadow: boxShadow),
        child: result,
      );
    }

    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: result);
    }

    return result;
  }
}

class _HexagonPainter extends CustomPainter {
  final Color? fillColor;
  final Gradient? gradient;
  final Color? borderColor;
  final double borderWidth;
  final double cornerRadius;
  final bool rotate;

  _HexagonPainter({
    this.fillColor,
    this.gradient,
    this.borderColor,
    this.borderWidth = 1.5,
    this.cornerRadius = 3.0,
    this.rotate = false,
  }) : assert(
         fillColor == null || gradient == null,
         'Cannot provide both fillColor and gradient',
       );

  @override
  void paint(Canvas canvas, Size size) {
    final path = _createRoundedHexagonPath(size);

    // Fill
    if (fillColor != null || gradient != null) {
      final fillPaint = Paint()..style = PaintingStyle.fill;

      if (gradient != null) {
        // Create shader from gradient
        final rect = Rect.fromLTWH(0, 0, size.width, size.height);
        fillPaint.shader = gradient!.createShader(rect);
      } else {
        fillPaint.color = fillColor!;
      }

      canvas.drawPath(path, fillPaint);
    }

    // Border
    if (borderColor != null) {
      final borderPaint = Paint()
        ..color = borderColor!
        ..style = PaintingStyle.stroke
        ..strokeWidth = borderWidth
        ..strokeJoin = StrokeJoin.round
        ..strokeCap = StrokeCap.round;
      canvas.drawPath(path, borderPaint);
    }
  }

  Path _createRoundedHexagonPath(Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = math.min(centerX, centerY) - (borderWidth / 2);

    // Calculate hexagon vertices
    final List<Offset> vertices = [];
    for (int i = 0; i < 6; i++) {
      final angle = (math.pi / 3) * i - (rotate ? 0 : (math.pi / 2));
      final x = centerX + radius * math.cos(angle);
      final y = centerY + radius * math.sin(angle);
      vertices.add(Offset(x, y));
    }

    // Create rounded path
    final path = Path();

    for (int i = 0; i < 6; i++) {
      final current = vertices[i];
      final next = vertices[(i + 1) % 6];
      final prev = vertices[(i - 1 + 6) % 6];

      // Calculate direction vectors
      final toPrev = (prev - current).normalize();
      final toNext = (next - current).normalize();

      // Calculate corner points
      final cornerStart = current + toPrev * cornerRadius;
      final cornerEnd = current + toNext * cornerRadius;

      if (i == 0) {
        path.moveTo(cornerStart.dx, cornerStart.dy);
      } else {
        path.lineTo(cornerStart.dx, cornerStart.dy);
      }

      // Add rounded corner using quadratic bezier
      path.quadraticBezierTo(
        current.dx,
        current.dy,
        cornerEnd.dx,
        cornerEnd.dy,
      );
    }

    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant _HexagonPainter oldDelegate) {
    return oldDelegate.fillColor != fillColor ||
        oldDelegate.gradient != gradient ||
        oldDelegate.borderColor != borderColor ||
        oldDelegate.borderWidth != borderWidth ||
        oldDelegate.cornerRadius != cornerRadius ||
        oldDelegate.rotate != rotate;
  }
}

extension _OffsetExtension on Offset {
  Offset normalize() {
    final length = distance;
    if (length == 0) return this;
    return this / length;
  }
}
