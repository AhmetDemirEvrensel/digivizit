import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Açık tema yükleme yer tutucusu: gri zemin üzerinde soldan sağa
/// parlayan shimmer efekti. Avatar/thumbnail loadingBuilder'larında ve
/// QR verisi beklenirken kullanılır.
class ShimmerBox extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadius borderRadius;
  final Color baseColor;

  const ShimmerBox({
    super.key,
    this.width,
    this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.baseColor = const Color(0xFFE5E9F0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: borderRadius,
          ),
        )
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(
          duration: 1200.ms,
          color: Colors.white.withValues(alpha: 0.55),
        );
  }
}
