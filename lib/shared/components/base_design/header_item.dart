import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:flutter/material.dart';

/// Header'da kullanılacak öğe tipi
enum HeaderItemType { icon, backButton, image, widget }

/// Header'daki sol, orta veya sağ bölümde gösterilecek öğe
class HeaderItem {
  final HeaderItemType type;

  // Icon button için
  final String? iconPath;
  final Widget? iconWidget;
  final double? iconSize;

  // Text button için (back button)
  final String? text;
  final String? subtitle;
  final TextStyle? textStyle;
  final TextStyle? subtitleStyle;
  final bool showBackArrow;

  // Image için
  final String? imagePath;
  final Widget? imageWidget;
  final double? imageWidth;
  final double? imageHeight;
  final BoxFit? imageFit;

  // Genel
  final VoidCallback? onTap;
  final Color? color;
  final Widget? customWidget;

  const HeaderItem._({
    required this.type,
    this.iconPath,
    this.iconWidget,
    this.iconSize,
    this.text,
    this.subtitle,
    this.textStyle,
    this.subtitleStyle,
    this.showBackArrow = false,
    this.imagePath,
    this.imageWidget,
    this.imageWidth,
    this.imageHeight,
    this.imageFit,
    this.onTap,
    this.color,
    this.customWidget,
  });

  /// Icon button oluşturur (hamburger menu, settings icon, vb.)
  factory HeaderItem.icon({
    String? iconPath,
    Widget? iconWidget,
    double? iconSize,
    VoidCallback? onTap,
    Color? color,
  }) {
    return HeaderItem._(
      type: HeaderItemType.icon,
      iconPath: iconPath,
      iconWidget: iconWidget,
      iconSize: iconSize ?? 40,
      onTap: onTap,
      color: color,
    );
  }

  /// Back button oluşturur (ok işareti + text + opsiyonel subtitle)
  factory HeaderItem.backButton({
    String? text,
    String? subtitle,
    TextStyle? textStyle,
    TextStyle? subtitleStyle,
    VoidCallback? onTap,
    Color? color,
    bool showBackArrow = true,
  }) {
    return HeaderItem._(
      type: HeaderItemType.backButton,
      text: text,
      subtitle: subtitle,
      textStyle: textStyle,
      subtitleStyle: subtitleStyle,
      onTap: onTap,
      color: color,
      showBackArrow: showBackArrow,
    );
  }

  /// Image oluşturur (logo, profil resmi, vb.)
  factory HeaderItem.image({
    String? imagePath,
    Widget? imageWidget,
    double? width,
    double? height,
    BoxFit? fit,
    VoidCallback? onTap,
  }) {
    return HeaderItem._(
      type: HeaderItemType.image,
      imagePath: imagePath,
      imageWidget: imageWidget,
      imageWidth: width,
      imageHeight: height,
      imageFit: fit ?? BoxFit.contain,
      onTap: onTap,
    );
  }

  /// Tamamen özel widget oluşturur
  factory HeaderItem.widget({required Widget child, VoidCallback? onTap}) {
    return HeaderItem._(
      type: HeaderItemType.widget,
      customWidget: child,
      onTap: onTap,
    );
  }

  /// HeaderItem'ı widget'a dönüştürür
  Widget build(BuildContext context) {
    Widget child;

    switch (type) {
      case HeaderItemType.icon:
        child = _buildIcon();
        break;
      case HeaderItemType.backButton:
        child = _buildBackButton(context);
        break;
      case HeaderItemType.image:
        child = _buildImage();
        break;
      case HeaderItemType.widget:
        child = customWidget ?? const SizedBox.shrink();
        break;
    }

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: child,
      );
    }

    return child;
  }

  Widget _buildIcon() {
    if (iconWidget != null) {
      return iconWidget!;
    }
    return IconButton(
      style: IconButton.styleFrom(
        foregroundColor: AppColors.baseWhite,
        backgroundColor: AppColors.buttonBgColor,
        side: BorderSide(color: AppColors.borderColor),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onPressed: onTap,
      icon: iconPath != null
          ? Image.asset(
              iconPath!,
              width: iconSize ?? 22,
              height: iconSize ?? 22,
              color: color,
            )
          : Icon(Icons.menu, size: iconSize ?? 22, color: color),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showBackArrow)
          IconButton(
            style: IconButton.styleFrom(
              foregroundColor: AppColors.baseWhite,
              backgroundColor: AppColors.buttonBgColor,
              side: BorderSide(color: AppColors.borderColor),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onPressed: onTap ?? () => Navigator.pop(context),
            icon: Icon(
              iconWidget != null ? null : Icons.arrow_back_ios_new_rounded,
              size: 22,
            ),
          ),
        if (text != null || subtitle != null)
          Flexible(
            child: Padding(
              padding: appSizer.paddingOnly(left: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (text != null)
                    FigmaBox(
                      width: 230,
                      child: Text(
                        text!,
                        style:
                            textStyle ??
                            appSizer.style(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: color ?? Colors.white,
                            ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style:
                          subtitleStyle ??
                          appSizer.style(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: (color ?? Colors.white).withValues(
                              alpha: 0.8,
                            ),
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildImage() {
    if (imageWidget != null) {
      return imageWidget!;
    }
    if (imagePath != null) {
      return Image.asset(
        imagePath!,
        width: imageWidth,
        height: imageHeight,
        fit: imageFit,
      );
    }
    return const SizedBox.shrink();
  }
}
