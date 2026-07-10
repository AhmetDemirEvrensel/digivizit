import 'dart:math' as math;

import 'package:digivizit/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppLoaderIndicator extends StatefulWidget {
  const AppLoaderIndicator({super.key, this.size = 76});

  final double size;

  @override
  State<AppLoaderIndicator> createState() => _AppLoaderIndicatorState();
}

class _AppLoaderIndicatorState extends State<AppLoaderIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1450),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final centerSize = widget.size * 0.56;

    return RepaintBoundary(
      child: SizedBox.square(
        dimension: widget.size,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final pulse = (math.sin(_controller.value * math.pi * 2) + 1) / 2;

            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: widget.size * (0.82 + (pulse * 0.06)),
                  height: widget.size * (0.82 + (pulse * 0.06)),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary500.withValues(
                          alpha: 0.08 + (pulse * 0.05),
                        ),
                        blurRadius: 22,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                ),
                CustomPaint(
                  size: Size.square(widget.size),
                  painter: _AppLoaderRingPainter(animation: _controller),
                ),
                Transform.scale(
                  scale: 0.96 + (pulse * 0.04),
                  child: Container(
                    width: centerSize,
                    height: centerSize,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [AppColors.primary400, AppColors.primary700],
                      ),
                      borderRadius: BorderRadius.circular(centerSize * 0.32),
                      border: Border.all(
                        color: AppColors.baseWhite.withValues(alpha: 0.85),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary600.withValues(alpha: 0.25),
                          blurRadius: 14,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.badge_rounded,
                      size: centerSize * 0.48,
                      color: AppColors.baseWhite,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _AppLoaderRingPainter extends CustomPainter {
  _AppLoaderRingPainter({required this.animation}) : super(repaint: animation);

  final Animation<double> animation;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final strokeWidth = size.width * 0.065;
    final radius = (size.shortestSide - strokeWidth) / 2;
    final ringRect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = AppColors.primary100.withValues(alpha: 0.72)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth,
    );

    final startAngle = (-math.pi / 2) + (animation.value * math.pi * 2);
    final sweepAngle = math.pi * 1.12;
    final arcPaint = Paint()
      ..shader = SweepGradient(
        colors: const [
          AppColors.primary200,
          AppColors.primary400,
          AppColors.primary700,
        ],
        stops: const [0, 0.52, 1],
        transform: GradientRotation(startAngle),
      ).createShader(ringRect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(ringRect, startAngle, sweepAngle, false, arcPaint);

    final dotAngle = startAngle + sweepAngle;
    final dotCenter = Offset(
      center.dx + (radius * math.cos(dotAngle)),
      center.dy + (radius * math.sin(dotAngle)),
    );
    canvas.drawCircle(
      dotCenter,
      strokeWidth * 1.15,
      Paint()
        ..color = AppColors.primary500.withValues(alpha: 0.20)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5),
    );
    canvas.drawCircle(
      dotCenter,
      strokeWidth * 0.52,
      Paint()..color = AppColors.primary600,
    );
  }

  @override
  bool shouldRepaint(covariant _AppLoaderRingPainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}
