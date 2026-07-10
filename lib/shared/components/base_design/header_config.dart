import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/constants/icon_paths.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/shared/components/base_design/header_item.dart';

/// Header konfigürasyonu - sol, orta ve sağ bölümler için
class HeaderConfig {
  /// Sol taraf öğesi (back button, icon, vb.)
  final HeaderItem? left;

  /// Orta öğe (başlık text/image, logo)
  final HeaderItem? center;

  /// Sağ taraf öğesi (icon, profil resmi, vb.)
  final HeaderItem? right;

  /// Header yüksekliği
  final double? height;

  /// Üst padding
  final double? topPadding;

  final double? fontSize;

  const HeaderConfig({
    this.left,
    this.center,
    this.right,
    this.height,
    this.topPadding,
    this.fontSize,
  });

  /// Sadece back button olan header
  factory HeaderConfig.withBackButton({
    String? title,
    String? subtitle,
    VoidCallback? onBackPressed,
    HeaderItem? center,
    HeaderItem? right,
    Color? color,
    double? fontSize,
  }) {
    return HeaderConfig(
      left: HeaderItem.backButton(
        text: title,
        subtitle: subtitle,
        onTap:
            onBackPressed ?? () => Navigator.pop(AppSettings.instance.context!),
        color: color ?? Colors.white,
      ),
      right: right ?? HeaderItem.icon(iconWidget: Image.network('')),
      center:
          center ??
          (title == null
              ? HeaderItem.image(imagePath: IconPaths.appIcon2)
              : null),
      fontSize: fontSize,
    );
  }

  /// Logo ortada, sol ve sağda icon'lar olan header (Home ekranı gibi)
  factory HeaderConfig.withCenterLogo({HeaderItem? left, HeaderItem? right}) {
    return HeaderConfig(
      left: left,
      center: HeaderItem.image(imagePath: IconPaths.appIcon2),
      right: right,
    );
  }

  /// Header widget'ını oluşturur
  Widget build(BuildContext context) {
    return Padding(
      padding: appSizer.paddingOnly(top: topPadding ?? 54),
      child: SizedBox(
        height: height ?? 61,
        width: double.infinity,
        child: Stack(
          children: [
            // Sol taraf
            if (left != null)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: Center(child: left!.build(context)),
              ),
            // Orta
            if (center != null)
              Positioned.fill(child: Center(child: center!.build(context))),
            // Sağ taraf
            if (right != null)
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Center(child: right!.build(context)),
              ),
          ],
        ),
      ),
    );
  }
}
