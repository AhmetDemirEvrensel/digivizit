import 'package:flutter/material.dart';
import 'package:digivizit/core/utils/app_sizer.dart';

class FigmaContainer extends StatelessWidget {
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? darkModeColor;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Widget? child;
  final Clip clipBehavior;
  const FigmaContainer({
    super.key,
    this.alignment,
    this.padding,
    this.color,
    this.darkModeColor,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.child,
    this.clipBehavior = Clip.none,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final adaptiveColor = color != null ? (isDarkMode ? (darkModeColor ?? color) : color) : null;

    return Container(
      alignment: alignment,
      padding: padding,
      color: adaptiveColor,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      width: width != null && width != double.infinity ? AppSizer.to.px(width!, Axis.horizontal) : width,
      height: height != null && height != double.infinity ? AppSizer.to.px(height!, Axis.vertical) : height,
      constraints: constraints,
      margin: margin,
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      child: child,
    );
  }
}
