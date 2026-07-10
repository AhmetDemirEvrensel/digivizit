import 'package:digivizit/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.primary500.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.arrow_forward_rounded,
        size: 17,
        color: AppColors.primary600,
      ),
    );
  }
}
