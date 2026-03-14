import 'package:flutter/material.dart';

class CustomButtonProperties {
  String? text;
  Function()? onPressed;
  bool activity;
  Widget? btnWidget;
  String? iconPath;
  bool isUnderLine;
  String? subtitle;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? outsidePadding;
  Color? color;

  CustomButtonProperties({
    this.text,
    this.onPressed,
    this.iconPath,
    this.activity = true,
    this.isUnderLine = false,
    this.btnWidget,
    this.subtitle,
    this.padding,
    this.outsidePadding,
    this.color,
  });
}
