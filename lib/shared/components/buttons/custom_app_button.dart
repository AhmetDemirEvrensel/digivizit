import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/enums/buton_enums.dart';
import 'package:digivizit/core/extensions/integer.dart';
import 'package:digivizit/shared/components/buttons/arrow_button.dart';

enum ButtonLayoutType { standard, arrow, hexagon }

enum ButtonStyleType { filled, outlined, text }

class CustomAppButton extends StatelessWidget {
  final dynamic Function()? onTap;
  final String text;
  final String? subtitle;
  final Widget? child;
  final ButtonLayoutType layoutType;
  final ButtonStyleType styleType;
  final String? iconPath;
  final double? iconSize;
  final IconData? leadingIcon;
  final String? leadingIconPath;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? iconColor;
  final Gradient? gradient;
  final double buttonHeight;
  final double borderRadius;
  final double textSize;
  final double iconSpacing;
  final EdgeInsetsGeometry? outsidePadding;
  final EdgeInsetsGeometry? contentPadding;
  final bool isActive;
  final bool isUnderLine;
  final bool showShadow;
  final bool showArrow;
  final bool showProBadge;
  final ContentAlignment contentAlignment;
  final double? hexagonSize;
  final Color? hexagonFillColor;
  final Color? hexagonBorderColor;
  final Color? hexagonIconColor;

  const CustomAppButton({
    super.key,
    required this.onTap,
    required this.text,
    this.subtitle,
    this.child,
    this.gradient,
    this.layoutType = ButtonLayoutType.standard,
    this.styleType = ButtonStyleType.filled,
    this.iconPath,
    this.iconSize = 24,
    this.leadingIcon,
    this.leadingIconPath,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.iconColor,
    this.buttonHeight = 56,
    this.borderRadius = 16,
    this.textSize = 15,
    this.iconSpacing = 8,
    this.outsidePadding = EdgeInsets.zero,
    this.contentPadding,
    this.isActive = true,
    this.isUnderLine = false,
    this.showShadow = true,
    this.showArrow = false,
    this.showProBadge = false,
    this.contentAlignment = ContentAlignment.center,
    this.hexagonSize,
    this.hexagonFillColor,
    this.hexagonBorderColor,
    this.hexagonIconColor,
  });

  factory CustomAppButton.outlined({
    Key? key,
    required dynamic Function()? onTap,
    required String text,
    String? subtitle,
    Widget? child,
    ButtonLayoutType layoutType = ButtonLayoutType.standard,
    String? iconPath,
    double iconSize = 24,
    IconData? leadingIcon,
    String? leadingIconPath,
    Color? borderColor,
    Color? backgroundColor,
    Gradient? gradient,
    Color? textColor,
    Color? iconColor,
    double buttonHeight = 56,
    double borderRadius = 16,
    double textSize = 15,
    double iconSpacing = 8,
    EdgeInsetsGeometry outsidePadding = EdgeInsets.zero,
    EdgeInsetsGeometry? contentPadding,
    bool isActive = true,
    bool isUnderLine = false,
    bool showShadow = false,
    bool showArrow = false,
    bool showProBadge = false,
    ContentAlignment contentAlignment = ContentAlignment.center,
    double? hexagonSize,
    Color? hexagonFillColor,
    Color? hexagonBorderColor,
    Color? hexagonIconColor,
  }) {
    return CustomAppButton(
      key: key,
      onTap: onTap,
      text: text,
      subtitle: subtitle,
      layoutType: layoutType,
      styleType: ButtonStyleType.outlined,
      iconPath: iconPath,
      iconSize: iconSize,
      leadingIcon: leadingIcon,
      leadingIconPath: leadingIconPath,
      borderColor: borderColor ?? AppColors.primary500,
      backgroundColor: backgroundColor,
      gradient: gradient,
      textColor: textColor ?? AppColors.primary600,
      iconColor: iconColor ?? AppColors.primary600,
      buttonHeight: buttonHeight,
      borderRadius: borderRadius,
      textSize: textSize,
      iconSpacing: iconSpacing,
      outsidePadding: outsidePadding,
      contentPadding: contentPadding,
      isActive: isActive,
      isUnderLine: isUnderLine,
      showShadow: showShadow,
      showArrow: showArrow,
      showProBadge: showProBadge,
      contentAlignment: contentAlignment,
      hexagonSize: hexagonSize,
      hexagonFillColor: hexagonFillColor,
      hexagonBorderColor: hexagonBorderColor,
      hexagonIconColor: hexagonIconColor,
      child: child,
    );
  }

  factory CustomAppButton.text({
    Key? key,
    required dynamic Function()? onTap,
    required String text,
    String? subtitle,
    Widget? child,
    ButtonLayoutType layoutType = ButtonLayoutType.standard,
    String? iconPath,
    double iconSize = 24,
    IconData? leadingIcon,
    String? leadingIconPath,
    Color? textColor,
    Color? iconColor,
    Gradient? gradient,
    double buttonHeight = 56,
    double borderRadius = 16,
    double textSize = 15,
    double iconSpacing = 8,
    EdgeInsetsGeometry outsidePadding = EdgeInsets.zero,
    EdgeInsetsGeometry? contentPadding,
    bool isActive = true,
    bool isUnderLine = false,
    bool showArrow = false,
    bool showProBadge = false,
    ContentAlignment contentAlignment = ContentAlignment.center,
  }) {
    return CustomAppButton(
      key: key,
      onTap: onTap,
      text: text,
      subtitle: subtitle,
      layoutType: layoutType,
      styleType: ButtonStyleType.text,
      gradient: gradient,
      iconPath: iconPath,
      iconSize: iconSize,
      leadingIcon: leadingIcon,
      leadingIconPath: leadingIconPath,
      textColor: textColor ?? AppColors.primary500,
      iconColor: iconColor ?? AppColors.primary500,
      buttonHeight: buttonHeight,
      borderRadius: borderRadius,
      textSize: textSize,
      iconSpacing: iconSpacing,
      outsidePadding: outsidePadding,
      contentPadding: contentPadding,
      isActive: isActive,
      isUnderLine: isUnderLine,
      showShadow: false,
      showArrow: showArrow,
      showProBadge: showProBadge,
      contentAlignment: contentAlignment,
      child: child,
    );
  }

  factory CustomAppButton.arrow({
    Key? key,
    required dynamic Function()? onTap,
    required String text,
    String? subtitle,
    Widget? child,
    ButtonStyleType styleType = ButtonStyleType.filled,
    String? iconPath,
    double iconSize = 24,
    IconData? leadingIcon,
    String? leadingIconPath,
    Color? backgroundColor,
    Color? borderColor,
    Color? textColor,
    Color? iconColor,
    Gradient? gradient,
    double buttonHeight = 56,
    double borderRadius = 16,
    double textSize = 15,
    double iconSpacing = 8,
    EdgeInsetsGeometry outsidePadding = EdgeInsets.zero,
    EdgeInsetsGeometry? contentPadding,
    bool isActive = true,
    bool showArrow = true,
    bool showShadow = true,
    bool showProBadge = false,
    bool isCenter = false,
  }) {
    return CustomAppButton(
      key: key,
      onTap: onTap,
      text: text,
      subtitle: subtitle,
      layoutType: ButtonLayoutType.arrow,
      styleType: styleType,
      iconPath: iconPath,
      iconSize: iconSize,
      leadingIcon: leadingIcon,
      leadingIconPath: leadingIconPath,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      textColor: textColor,
      iconColor: iconColor,
      gradient: gradient,
      buttonHeight: buttonHeight,
      borderRadius: borderRadius,
      textSize: textSize,
      iconSpacing: iconSpacing,
      outsidePadding: outsidePadding,
      contentPadding: contentPadding,
      isActive: isActive,
      showArrow: showArrow,
      showShadow: showShadow,
      showProBadge: showProBadge,
      contentAlignment: isCenter
          ? ContentAlignment.center
          : ContentAlignment.left,
      child: child,
    );
  }

  factory CustomAppButton.hexagon({
    Key? key,
    required dynamic Function()? onTap,
    required String text,
    required String subtitle,
    Widget? child,
    ButtonStyleType styleType = ButtonStyleType.filled,
    IconData? leadingIcon,
    String? iconPath,
    Color? backgroundColor,
    Color? borderColor,
    Color? textColor,
    Color? iconColor,
    Gradient? gradient,
    double? buttonHeight,
    double borderRadius = 16,
    double textSize = 15,
    double iconSpacing = 8,
    EdgeInsetsGeometry outsidePadding = EdgeInsets.zero,
    EdgeInsetsGeometry? contentPadding,
    bool isActive = true,
    bool showArrow = true,
    bool showShadow = true,
    bool showProBadge = false,
    double? hexagonSize,
    Color? hexagonFillColor,
    Color? hexagonBorderColor,
    Color? hexagonIconColor,
  }) {
    return CustomAppButton(
      key: key,
      onTap: onTap,
      text: text,
      subtitle: subtitle,
      layoutType: ButtonLayoutType.hexagon,
      styleType: styleType,
      leadingIcon: leadingIcon,
      leadingIconPath: iconPath,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      textColor: textColor,
      iconColor: iconColor,
      gradient: gradient,
      buttonHeight: buttonHeight ?? 80.pxv,
      borderRadius: borderRadius,
      textSize: textSize,
      iconSpacing: iconSpacing,
      outsidePadding: outsidePadding,
      contentPadding: contentPadding,
      isActive: isActive,
      showArrow: showArrow,
      showShadow: showShadow,
      showProBadge: showProBadge,
      contentAlignment: ContentAlignment.left,
      hexagonSize: hexagonSize,
      hexagonFillColor: hexagonFillColor,
      hexagonBorderColor: hexagonBorderColor,
      hexagonIconColor: hexagonIconColor,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return switch (layoutType) {
      ButtonLayoutType.standard => _buildStandardButton(),
      ButtonLayoutType.arrow => _buildArrowButton(),
      ButtonLayoutType.hexagon => _buildHexagonButton(),
    };
  }

  Widget _buildBaseButton({
    required Widget child,
    EdgeInsetsGeometry? padding,
    required Color bgColor,
    required Color icnColor,
    required Color txtColor,
    required bool hasBorder,
    required bool hasShadow,
    bool useFixedHeight = true,
  }) {
    return Semantics(
      button: true,
      enabled: isActive,
      onTap: isActive ? onTap : null,
      child: AnimatedOpacity(
        opacity: isActive ? 1 : 0.55,
        duration: const Duration(milliseconds: 180),
        child: GestureDetector(
          onTap: isActive ? onTap : null,
          child: Container(
            width: double.infinity,
            height: useFixedHeight ? buttonHeight : null,
            constraints: useFixedHeight
                ? null
                : BoxConstraints(minHeight: buttonHeight),
            margin: outsidePadding,
            decoration: ShapeDecoration(
              color: gradient != null ? null : bgColor,
              gradient: gradient,
              shape: RoundedRectangleBorder(
                side: hasBorder
                    ? BorderSide(
                        color:
                            borderColor ??
                            (styleType == ButtonStyleType.filled
                                ? bgColor
                                : AppColors.hairline),
                      )
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              shadows: hasShadow
                  ? [
                      BoxShadow(
                        color: bgColor.withValues(alpha: 0.24),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ]
                  : null,
            ),
            child: Padding(
              padding: padding ?? appSizer.paddingSymmetric(horizontal: 24),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStandardButton() {
    final colors = _getStyleColors();
    final buttonWidget = _buildBaseButton(
      bgColor: colors.bgColor,
      txtColor: colors.txtColor,
      icnColor: colors.icnColor,
      hasBorder: colors.hasBorder,
      hasShadow: showShadow && styleType != ButtonStyleType.text,
      child:
          child ??
          Row(
            mainAxisAlignment: _getMainAxisAlignment(),
            mainAxisSize: MainAxisSize.max,
            children: [
              if (leadingIconPath != null) ...[
                Image.asset(
                  leadingIconPath!,
                  color: colors.icnColor,
                  width: iconSize ?? 20.pxh,
                  height: iconSize ?? 20.pxh,
                ),
                SizedBox(width: iconSpacing),
              ],
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: _getTextStyle(colors.txtColor),
                ),
              ),
              if (iconPath != null) ...[
                SizedBox(width: iconSpacing),
                Image.asset(
                  iconPath!,
                  color: colors.icnColor,
                  width: iconSize ?? 20.pxh,
                  height: iconSize ?? 20.pxh,
                ),
              ],
              if (showArrow) ...[SizedBox(width: iconSpacing), ArrowButton()],
            ],
          ),
    );
    return buttonWidget;
  }

  Widget _buildArrowButton() {
    final colors = _getStyleColors();
    final buttonWidget = _buildBaseButton(
      bgColor: colors.bgColor,
      txtColor: colors.txtColor,
      icnColor: colors.icnColor,
      hasBorder: colors.hasBorder,
      hasShadow: showShadow && styleType != ButtonStyleType.text,
      padding: contentPadding,
      child:
          child ??
          Row(
            mainAxisAlignment: contentAlignment == ContentAlignment.center
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              if (leadingIconPath != null) ...[
                Image.asset(
                  leadingIconPath!,
                  color: colors.icnColor,
                  width: iconSize ?? 20.pxh,
                  height: iconSize ?? 20.pxh,
                ),
                SizedBox(width: iconSpacing),
              ],
              if (leadingIcon != null) ...[
                Icon(
                  leadingIcon,
                  color: colors.icnColor,
                  size: iconSize ?? 20.pxh,
                ),
                SizedBox(width: iconSpacing),
              ],
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:
                      contentAlignment == ContentAlignment.center
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    Text(text, style: _getTextStyle(colors.txtColor)),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: AppFonts.base2Regular.withColor(
                          colors.txtColor.withValues(alpha: 0.7),
                        ),
                      ),
                  ],
                ),
              ),
              if (showArrow && contentAlignment != ContentAlignment.center)
                ArrowButton(),
            ],
          ),
    );
    return buttonWidget;
  }

  Widget _buildHexagonButton() {
    final colors = _getStyleColors();
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        _buildBaseButton(
          bgColor: colors.bgColor,
          txtColor: colors.txtColor,
          icnColor: colors.icnColor,
          hasBorder: colors.hasBorder,
          hasShadow: showShadow && styleType != ButtonStyleType.text,
          useFixedHeight: false,
          padding:
              contentPadding ??
              EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child:
              child ??
              Row(
                children: [
                  if (leadingIconPath != null || leadingIcon != null)
                    Container(
                      width: hexagonSize ?? 52.pxv,
                      height: hexagonSize ?? 52.pxv,
                      padding: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        color:
                            hexagonFillColor ??
                            colors.icnColor.withValues(alpha: 0.12),
                        border: Border.all(
                          color: hexagonBorderColor ?? AppColors.hairline,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: leadingIconPath != null
                          ? Image.asset(
                              leadingIconPath!,
                              color: hexagonIconColor ?? colors.icnColor,
                            )
                          : Icon(
                              leadingIcon,
                              color: hexagonIconColor ?? colors.icnColor,
                            ),
                    ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text,
                          style: AppFonts.lgBold.withColor(colors.txtColor),
                        ),
                        if (subtitle != null)
                          Text(
                            subtitle!,
                            style: AppFonts.base2Regular.withColor(
                              colors.txtColor.withValues(alpha: 0.7),
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (showArrow)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: ArrowButton(),
                    ),
                ],
              ),
        ),
      ],
    );
  }

  MainAxisAlignment _getMainAxisAlignment() {
    switch (contentAlignment) {
      case ContentAlignment.left:
        return MainAxisAlignment.start;
      case ContentAlignment.center:
        return MainAxisAlignment.center;
      case ContentAlignment.right:
        return MainAxisAlignment.end;
    }
  }

  ({Color bgColor, Color txtColor, Color icnColor, bool hasBorder})
  _getStyleColors() {
    switch (styleType) {
      case ButtonStyleType.filled:
        return (
          bgColor:
              backgroundColor ??
              (!isActive ? AppColors.neutral500 : AppColors.primary500),
          txtColor: textColor ?? Colors.white,
          icnColor: iconColor ?? Colors.white,
          hasBorder: borderColor != null,
        );

      case ButtonStyleType.outlined:
        return (
          bgColor: backgroundColor ?? AppColors.baseWhite,
          txtColor: textColor ?? AppColors.primary600,
          icnColor: iconColor ?? AppColors.primary600,
          hasBorder: true,
        );

      case ButtonStyleType.text:
        return (
          bgColor: Colors.transparent,
          txtColor: textColor ?? AppColors.primary600,
          icnColor: iconColor ?? AppColors.primary600,
          hasBorder: false,
        );
    }
  }

  TextStyle _getTextStyle(Color txtColor) {
    return appSizer.style(
      fontSize: textSize,
      fontWeight: FontWeight.w600,
      color: txtColor,
      decoration: isUnderLine ? TextDecoration.underline : null,
      decorationColor: isUnderLine ? txtColor : null,
    );
  }
}
