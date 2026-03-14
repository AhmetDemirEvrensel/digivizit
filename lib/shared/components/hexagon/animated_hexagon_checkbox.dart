import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/app_colors.dart';

/// Animated hexagon checkbox with smooth check animation
class AnimatedHexagonCheckbox extends StatefulWidget {
  final double size;
  final bool isChecked;
  final VoidCallback? onChanged;
  final Color? checkedColor;
  final Color? uncheckedColor;
  final Color? borderColor;
  final Color? checkColor;
  final double cornerRadius;
  final Duration animationDuration;

  const AnimatedHexagonCheckbox({
    super.key,
    this.size = 24,
    required this.isChecked,
    this.onChanged,
    this.checkedColor,
    this.uncheckedColor,
    this.borderColor,
    this.checkColor,
    this.cornerRadius = 3.0,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  @override
  State<AnimatedHexagonCheckbox> createState() => _AnimatedHexagonCheckboxState();
}

class _AnimatedHexagonCheckboxState extends State<AnimatedHexagonCheckbox> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _checkAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.animationDuration, vsync: this);

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _checkAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    if (widget.isChecked) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(AnimatedHexagonCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isChecked != oldWidget.isChecked) {
      if (widget.isChecked) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onChanged,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            size: Size(widget.size, widget.size),
            painter: _HexagonPainter(
              fillColor: widget.isChecked ? (widget.checkedColor ?? AppColors.primary500) : widget.uncheckedColor,
              borderColor: widget.borderColor ?? AppColors.neutral300,
              borderWidth: 1.5,
              cornerRadius: widget.cornerRadius,
            ),
            child: SizedBox(
              width: widget.size,
              height: widget.size,
              child: Center(
                child: Transform.scale(
                  scale: _scaleAnimation.value,
                  child: CustomPaint(
                    size: Size(widget.size * 0.5, widget.size * 0.5),
                    painter: _CheckPainter(progress: _checkAnimation.value, color: widget.checkColor ?? AppColors.baseWhite, strokeWidth: 2.5),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Animated check mark painter
class _CheckPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  _CheckPainter({required this.progress, required this.color, this.strokeWidth = 2.0});

  @override
  void paint(Canvas canvas, Size size) {
    if (progress == 0) return;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();

    // Check mark points (relative to size)
    final startX = size.width * 0.15;
    final startY = size.height * 0.5;
    final midX = size.width * 0.4;
    final midY = size.height * 0.75;
    final endX = size.width * 0.85;
    final endY = size.height * 0.25;

    // Total path length calculation
    final firstSegmentLength = math.sqrt(math.pow(midX - startX, 2) + math.pow(midY - startY, 2));
    final secondSegmentLength = math.sqrt(math.pow(endX - midX, 2) + math.pow(endY - midY, 2));
    final totalLength = firstSegmentLength + secondSegmentLength;

    final drawLength = totalLength * progress;

    path.moveTo(startX, startY);

    if (drawLength <= firstSegmentLength) {
      // Only draw first segment partially
      final ratio = drawLength / firstSegmentLength;
      final currentX = startX + (midX - startX) * ratio;
      final currentY = startY + (midY - startY) * ratio;
      path.lineTo(currentX, currentY);
    } else {
      // Draw complete first segment
      path.lineTo(midX, midY);

      // Draw second segment partially
      final remainingLength = drawLength - firstSegmentLength;
      final ratio = remainingLength / secondSegmentLength;
      final currentX = midX + (endX - midX) * ratio;
      final currentY = midY + (endY - midY) * ratio;
      path.lineTo(currentX, currentY);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _CheckPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color || oldDelegate.strokeWidth != strokeWidth;
  }
}

class _HexagonPainter extends CustomPainter {
  final Color? fillColor;
  final Color? borderColor;
  final double borderWidth;
  final double cornerRadius;

  _HexagonPainter({this.fillColor, this.borderColor, this.borderWidth = 1.5, this.cornerRadius = 3.0});

  @override
  void paint(Canvas canvas, Size size) {
    final path = _createRoundedHexagonPath(size);

    // Fill
    if (fillColor != null) {
      final fillPaint = Paint()
        ..color = fillColor!
        ..style = PaintingStyle.fill;
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
      final angle = (math.pi / 3) * i - (math.pi / 2);
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
      path.quadraticBezierTo(current.dx, current.dy, cornerEnd.dx, cornerEnd.dy);
    }

    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant _HexagonPainter oldDelegate) {
    return oldDelegate.fillColor != fillColor ||
        oldDelegate.borderColor != borderColor ||
        oldDelegate.borderWidth != borderWidth ||
        oldDelegate.cornerRadius != cornerRadius;
  }
}

extension _OffsetExtension on Offset {
  Offset normalize() {
    final length = distance;
    if (length == 0) return this;
    return this / length;
  }
}
