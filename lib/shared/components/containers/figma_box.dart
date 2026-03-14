import 'package:flutter/material.dart';
import 'package:digivizit/core/utils/app_sizer.dart';

class FigmaBox extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  const FigmaBox({super.key, this.width, this.height, this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: key,
      width: width != null ? AppSizer.to.px(width!, Axis.horizontal) : null,
      height: height != null ? AppSizer.to.px(height!, Axis.vertical) : null,
      child: child,
    );
  }
}
