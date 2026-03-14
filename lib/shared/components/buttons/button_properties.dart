import 'package:flutter/material.dart';
import 'package:digivizit/core/enums/buton_enums.dart';
import 'package:digivizit/shared/components/buttons/custom_app_button.dart';

class ButtonProperties {
  String? text;
  String? iconPath;
  Function()? onPressed;
  List<Color>? colors;
  Color? color;
  Color? textColor;
  Color? iconColor;
  bool activity;
  Widget? child;
  bool? leftIcon;
  String? subtitle;
  ButtonLayoutType layoutType;
  ButtonStyleType styleType;
  double? iconSize;
  IconData? leadingIcon;
  String? leadingIconPath;
  Color? borderColor;
  Color? backgroundColor;
  double buttonHeight;
  double borderRadius;
  double textSize;
  double iconSpacing;
  EdgeInsetsGeometry? outsidePadding;
  EdgeInsetsGeometry? contentPadding;
  bool isActive;
  bool isUnderLine;
  bool showShadow;
  bool showArrow;
  bool showProBadge;
  ContentAlignment contentAlignment;
  double? hexagonSize;
  Color? hexagonFillColor;
  Color? hexagonBorderColor;
  Color? hexagonIconColor;
  Gradient? gradient;

  ButtonProperties({
    this.text,
    this.iconPath,
    this.activity = true,
    this.onPressed,
    this.colors,
    this.iconColor,
    this.textColor,
    this.child,
    this.color,
    this.leftIcon,
    this.subtitle,
    this.layoutType = ButtonLayoutType.standard,
    this.styleType = ButtonStyleType.filled,
    this.iconSize,
    this.leadingIcon,
    this.leadingIconPath,
    this.borderColor,
    this.backgroundColor,
    this.buttonHeight = 56,
    this.borderRadius = 16,
    this.textSize = 15,
    this.iconSpacing = 8,
    this.outsidePadding,
    this.contentPadding,
    bool? isActive,
    this.isUnderLine = false,
    this.showShadow = true,
    this.showArrow = false,
    this.showProBadge = false,
    this.contentAlignment = ContentAlignment.center,
    this.hexagonSize,
    this.hexagonFillColor,
    this.hexagonBorderColor,
    this.hexagonIconColor,
    this.gradient,
  }) : isActive = isActive ?? activity {
    if (backgroundColor == null && color != null) {
      backgroundColor = color;
    }
  }

  ButtonProperties copyWith({
    String? text,
    String? iconPath,
    Function()? onPressed,
    List<Color>? colors,
    Color? color,
    Color? iconColor,
    Color? textColor,
    bool? leftIcon,
    String? subtitle,
    ButtonLayoutType? layoutType,
    ButtonStyleType? styleType,
    double? iconSize,
    IconData? leadingIcon,
    String? leadingIconPath,
    Color? borderColor,
    Color? backgroundColor,
    double? buttonHeight,
    double? borderRadius,
    double? textSize,
    double? iconSpacing,
    EdgeInsetsGeometry? outsidePadding,
    EdgeInsetsGeometry? contentPadding,
    bool? isActive,
    bool? isUnderLine,
    bool? showShadow,
    bool? showArrow,
    bool? showProBadge,
    ContentAlignment? contentAlignment,
    double? hexagonSize,
    Color? hexagonFillColor,
    Color? hexagonBorderColor,
    Color? hexagonIconColor,
    Gradient? gradient,
  }) {
    return ButtonProperties(
      iconPath: iconPath ?? this.iconPath,
      onPressed: onPressed ?? this.onPressed,
      color: color ?? this.color,
      iconColor: iconColor ?? this.iconColor,
      textColor: textColor ?? this.textColor,
      leftIcon: leftIcon ?? this.leftIcon,
      colors: colors ?? this.colors,
      text: text ?? this.text,
      subtitle: subtitle ?? this.subtitle,
      layoutType: layoutType ?? this.layoutType,
      styleType: styleType ?? this.styleType,
      iconSize: iconSize ?? this.iconSize,
      leadingIcon: leadingIcon ?? this.leadingIcon,
      leadingIconPath: leadingIconPath ?? this.leadingIconPath,
      borderColor: borderColor ?? this.borderColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      buttonHeight: buttonHeight ?? this.buttonHeight,
      borderRadius: borderRadius ?? this.borderRadius,
      textSize: textSize ?? this.textSize,
      iconSpacing: iconSpacing ?? this.iconSpacing,
      outsidePadding: outsidePadding ?? this.outsidePadding,
      contentPadding: contentPadding ?? this.contentPadding,
      isActive: isActive ?? this.isActive,
      isUnderLine: isUnderLine ?? this.isUnderLine,
      showShadow: showShadow ?? this.showShadow,
      showArrow: showArrow ?? this.showArrow,
      showProBadge: showProBadge ?? this.showProBadge,
      contentAlignment: contentAlignment ?? this.contentAlignment,
      hexagonSize: hexagonSize ?? this.hexagonSize,
      hexagonFillColor: hexagonFillColor ?? this.hexagonFillColor,
      hexagonBorderColor: hexagonBorderColor ?? this.hexagonBorderColor,
      hexagonIconColor: hexagonIconColor ?? this.hexagonIconColor,
      gradient: gradient ?? this.gradient,
    );
  }
}
