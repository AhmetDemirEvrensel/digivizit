import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/app_fonts.dart';

class WaterWaveHexagon extends StatefulWidget {
  final double size;
  final double level;
  final String text;
  final Color? waterColor;

  const WaterWaveHexagon({
    super.key,
    required this.size,
    required this.level,
    required this.text,
    this.waterColor,
  });

  @override
  State<WaterWaveHexagon> createState() => _WaterWaveHexagonState();
}

class _WaterWaveHexagonState extends State<WaterWaveHexagon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.size, widget.size),
          painter: _WaterHexagonPainter(
            progress: _controller.value,
            waterLevel: widget.level,
            waterColor: widget.waterColor ?? Colors.blue.withValues(alpha: 0.6),
            borderColor: Colors.white.withValues(alpha: 0.3),
            fillColor: Colors.white.withValues(alpha: 0.1),
          ),
          child: SizedBox(
            width: widget.size,
            height: widget.size,
            child: Center(
              child: Text(
                widget.text,
                style: AppFonts.baseSemibold.copyWith(fontSize: 15),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _WaterHexagonPainter extends CustomPainter {
  final double progress;
  final double waterLevel;
  final Color waterColor;
  final Color? borderColor;
  final Color? fillColor;
  final double borderWidth;
  final double cornerRadius;

  _WaterHexagonPainter({
    required this.progress,
    required this.waterLevel,
    required this.waterColor,
    this.borderColor,
    this.fillColor,
    this.borderWidth = 1.15,
    this.cornerRadius = 5.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = _createRoundedHexagonPath(size);

    if (fillColor != null) {
      canvas.drawPath(
        path,
        Paint()
          ..color = fillColor!
          ..style = PaintingStyle.fill,
      );
    }

    canvas.save();
    canvas.clipPath(path);

    final wavePath = Path();
    final waveHeight = size.height * 0.08;
    final baseline = size.height * (1 - waterLevel);

    wavePath.moveTo(0, baseline);
    for (double x = 0; x <= size.width; x++) {
      final y =
          baseline +
          math.sin((x / size.width * 2 * math.pi) + (progress * 2 * math.pi)) *
              waveHeight *
              0.5;
      wavePath.lineTo(x, y);
    }
    wavePath.lineTo(size.width, size.height);
    wavePath.lineTo(0, size.height);
    wavePath.close();

    canvas.drawPath(
      wavePath,
      Paint()
        ..color = waterColor
        ..style = PaintingStyle.fill,
    );
    canvas.restore();

    if (borderColor != null) {
      canvas.drawPath(
        path,
        Paint()
          ..color = borderColor!
          ..style = PaintingStyle.stroke
          ..strokeWidth = borderWidth
          ..strokeJoin = StrokeJoin.round
          ..strokeCap = StrokeCap.round,
      );
    }
  }

  Path _createRoundedHexagonPath(Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = (size.width / 2) - (borderWidth / 2);

    final List<Offset> vertices = [];
    for (int i = 0; i < 6; i++) {
      final angle = (math.pi / 3) * i - (math.pi / 2);
      final x = centerX + radius * math.cos(angle);
      final y = centerY + radius * math.sin(angle);
      vertices.add(Offset(x, y));
    }

    final path = Path();
    for (int i = 0; i < 6; i++) {
      final current = vertices[i];
      final next = vertices[(i + 1) % 6];
      final prev = vertices[(i - 1 + 6) % 6];

      final toPrev = (prev - current).normalize();
      final toNext = (next - current).normalize();

      final cornerStart = current + toPrev * cornerRadius;
      final cornerEnd = current + toNext * cornerRadius;

      if (i == 0) {
        path.moveTo(cornerStart.dx, cornerStart.dy);
      } else {
        path.lineTo(cornerStart.dx, cornerStart.dy);
      }
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
  bool shouldRepaint(covariant _WaterHexagonPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.waterLevel != waterLevel;
  }
}

extension _OffsetExtension on Offset {
  Offset normalize() {
    final length = distance;
    if (length == 0) return this;
    return this / length;
  }
}
