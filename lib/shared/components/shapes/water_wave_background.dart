import 'dart:math' as math;

import 'package:flutter/material.dart';

class WaterWaveBackground extends StatefulWidget {
  final double level;
  final Color waterColor;
  final double waveHeightFactor;
  final Widget? child;

  const WaterWaveBackground({
    super.key,
    required this.level,
    required this.waterColor,
    this.waveHeightFactor = 0.05,
    this.child,
  });

  @override
  State<WaterWaveBackground> createState() => _WaterWaveBackgroundState();
}

class _WaterWaveBackgroundState extends State<WaterWaveBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
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
          painter: _WaterRectPainter(
            progress: _controller.value,
            waterLevel: widget.level,
            waterColor: widget.waterColor,
            waveHeightFactor: widget.waveHeightFactor,
          ),
          child: widget.child,
        );
      },
    );
  }
}

class _WaterRectPainter extends CustomPainter {
  final double progress;
  final double waterLevel;
  final Color waterColor;
  final double waveHeightFactor;

  _WaterRectPainter({
    required this.progress,
    required this.waterLevel,
    required this.waterColor,
    required this.waveHeightFactor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final wavePath = Path();
    final waveHeight = size.height * waveHeightFactor;
    final baseline = size.height * (1 - waterLevel);

    wavePath.moveTo(0, baseline);
    for (double x = 0; x <= size.width; x++) {
      final y =
          baseline +
          math.sin((x / size.width * 2 * math.pi) + (progress * 2 * math.pi)) *
              waveHeight;
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
  }

  @override
  bool shouldRepaint(covariant _WaterRectPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.waterLevel != waterLevel ||
        oldDelegate.waterColor != waterColor;
  }
}
