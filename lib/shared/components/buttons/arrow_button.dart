import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/icon_paths.dart';
import 'package:digivizit/core/extensions/integer.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28.pxh,
      height: 28.pxh,
      padding: EdgeInsets.all(6.pxh),
      decoration: ShapeDecoration(
        color: Colors.white.withValues(alpha: 0.20),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.15,
            color: Colors.white.withValues(alpha: 0.30),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Image.asset(IconPaths.arrowIcon),
    );
  }
}
