import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/constants/icon_paths.dart';
import 'package:digivizit/core/constants/image_paths.dart';
import 'package:digivizit/core/enums/buton_enums.dart';
import 'package:digivizit/core/extensions/integer.dart';
import 'package:digivizit/shared/components/buttons/arrow_button.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';
import 'package:digivizit/shared/components/hexagon/hexagon_widget.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? text;
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double? fontSize;
  final TextStyle? style;
  final bool? isPro;
  final CustomButtonType type;
  final bool? isCenter;
  final ContentAlignment? contentAlignment;
  final bool? isIcon;

  const CustomButton._({
    super.key,
    required this.onTap,
    this.text,
    this.title,
    this.subtitle,
    this.icon,
    this.width,
    this.height,
    this.borderRadius = 16,
    this.backgroundColor,
    this.borderColor,
    this.textColor = Colors.white,
    this.fontSize = 16,
    this.style,
    this.isPro = false,
    required this.type,
    this.isCenter = false,
    this.contentAlignment,
    this.isIcon = false,
  });

  factory CustomButton({
    Key? key,
    required VoidCallback onTap,
    String text = 'Devam Et',
    IconData? icon = Icons.arrow_forward_ios,
    double? width,
    double height = 56,
    double borderRadius = 16,
    Color? backgroundColor,
    Color? borderColor,
    Color? textColor = Colors.white,
    double fontSize = 16,
    TextStyle? style,
    ContentAlignment? contentAlignment,
    bool isIcon = false,
  }) {
    return CustomButton._(
      key: key,
      onTap: onTap,
      text: text,
      icon: icon,
      width: width,
      height: height,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      textColor: textColor,
      fontSize: fontSize,
      style: style,
      type: CustomButtonType.text,
      contentAlignment: contentAlignment,
      isIcon: isIcon,
    );
  }

  factory CustomButton.icon({
    Key? key,
    required VoidCallback onTap,
    String text = 'Devam Et',
    IconData? icon = Icons.arrow_forward_ios,
    double? width,
    double height = 56,
    double borderRadius = 16,
    Color? backgroundColor,
    Color? borderColor,
    Color? textColor = Colors.white,
    double fontSize = 16,
    TextStyle? style,
    bool isCenter = false,
  }) {
    return CustomButton._(
      key: key,
      onTap: onTap,
      text: text,
      icon: icon,
      width: width,
      height: height,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      textColor: textColor,
      fontSize: fontSize,
      style: style,
      type: CustomButtonType.icon,
      isCenter: isCenter,
    );
  }

  factory CustomButton.action({
    Key? key,
    required VoidCallback onTap,
    required String title,
    required String subtitle,
    required IconData icon,
    bool isPro = false,
    Color? backgroundColor,
    double? width,
    double? height,
  }) {
    return CustomButton._(
      key: key,
      onTap: onTap,
      title: title,
      subtitle: subtitle,
      icon: icon,
      isPro: isPro,
      backgroundColor: backgroundColor,
      width: width,
      height: height ?? 80.pxv,
      type: CustomButtonType.action,
    );
  }

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      CustomButtonType.text => _buildRegularButton(),
      CustomButtonType.icon => _buildIconButton(),
      CustomButtonType.action => _buildActionButton(),
    };
  }

  Widget _buildBaseButton({required Widget child, EdgeInsetsGeometry? padding}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        constraints: BoxConstraints(minHeight: height ?? 0),
        decoration: ShapeDecoration(
          color: backgroundColor ?? Colors.white.withValues(alpha: 0.20),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.15, color: borderColor ?? Colors.white.withValues(alpha: 0.30)),
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          shadows: const [BoxShadow(color: Color(0x33000000), blurRadius: 30, offset: Offset(0, 10), spreadRadius: 0)],
        ),
        child: Padding(padding: padding ?? appSizer.paddingSymmetric(horizontal: 24), child: child),
      ),
    );
  }

  Widget _buildRegularButton() {
    return _buildBaseButton(
      child: Row(
        mainAxisAlignment: _getMainAxisAlignment(),
        mainAxisSize: MainAxisSize.min,
        children: [
          if (text != null) Text(text!, textAlign: TextAlign.center, style: style ?? AppFonts.lgSemibold.withColor(textColor!)),
          if (icon != null && isIcon == true) ...[const SizedBox(width: 10), Icon(icon, color: textColor, size: 20.pxh)],
        ],
      ),
    );
  }

  Widget _buildIconButton() {
    return _buildBaseButton(
      child: Row(
        mainAxisAlignment: isCenter ?? false ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          if (icon != null) ...[Icon(icon, color: textColor, size: 30.pxh), const SizedBox(width: 10)],
          if (text != null) Text(text!, textAlign: TextAlign.center, style: style ?? AppFonts.lgSemibold.withColor(textColor!)),
          isCenter ?? false ? const SizedBox() : const Spacer(),
          isCenter ?? false ? const SizedBox() : ArrowButton(),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    return Stack(
      alignment: AlignmentGeometry.topRight,
      clipBehavior: Clip.hardEdge,
      children: [
        _buildBaseButton(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Row(
            spacing: 12,
            children: [
              HexagonWidget.icon(icon: icon!, size: 50, fillColor: AppColors.buttonBgColor, borderColor: AppColors.borderColor, iconColor: AppColors.baseWhite),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title!, style: AppFonts.lgBold.withColor(textColor ?? Colors.white)),
                    Text(subtitle!, style: AppFonts.baseRegular.withColor((textColor ?? Colors.white).withValues(alpha: 0.7))),
                  ],
                ),
              ),
              FigmaContainer(
                width: 34.pxh,
                height: 34.pxh,
                padding: EdgeInsets.all(8.pxh),
                decoration: ShapeDecoration(
                  color: Colors.white.withValues(alpha: 0.20),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.15, color: Colors.white.withValues(alpha: 0.30)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Image.asset(IconPaths.arrowIcon),
              ),
            ],
          ),
        ),
        if (isPro ?? false) Positioned(top: -10, right: -10, child: Image.asset(ImagePaths.pro, width: 70)),
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
      case null:
        return MainAxisAlignment.center;
    }
  }
}
