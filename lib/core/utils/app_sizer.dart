import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:digivizit/core/providers/app_settings.dart';

class AppSizer extends GetxController {
  // FIGMA TASARIM BOYUTLARI (design size)
  final double _designWidth;
  final double _designHeight;

  double get designWidth => _designWidth;
  double get designHeight => _designHeight;

  final String? _defaultFontFamily; // GoogleFonts için family adı
  final String? _defaultCustomFontFamily; // Assets font için family adı
  final FontWeight? _defaultFontWeight;
  final Color? _defaultTextColor;

  String? get defaultFontFamily => _defaultFontFamily;
  String? get defaultCustomFontFamily => _defaultCustomFontFamily;
  FontWeight? get defaultFontWeight => _defaultFontWeight;
  Color? get defaultTextColor => _defaultTextColor;

  AppSizer({
    required double designWidth,
    required double designHeight,
    String? defaultFontFamily,
    String? defaultCustomFontFamily,
    FontWeight? defaultFontWeight,
    Color? defaultTextColor,
  }) : _designWidth = designWidth,
       _designHeight = designHeight,
       _defaultFontFamily = defaultFontFamily,
       _defaultCustomFontFamily = defaultCustomFontFamily,
       _defaultFontWeight = defaultFontWeight,
       _defaultTextColor = defaultTextColor;

  /// Kolay erişim için: AppSizer.to.px(...)
  static AppSizer get to => Get.find<AppSizer>();

  /// Bir kere app başlarken çağır:
  ///
  /// AppSizer.setup(
  ///   designWidth: 390,
  ///   designHeight: 844,
  ///   defaultFontFamily: 'Inter',
  ///   defaultFontWeight: FontWeight.w500,
  ///   defaultTextColor: Colors.black,
  /// );
  static void setup({
    required double designWidth,
    required double designHeight,
    FontWeight? defaultFontWeight,
    Color? defaultTextColor,
    String? defaultFontFamily,
    String? defaultCustomFontFamily,
  }) {
    Get.put(
      AppSizer(
        designWidth: designWidth,
        designHeight: designHeight,
        defaultFontFamily: defaultFontFamily,
        defaultCustomFontFamily: defaultCustomFontFamily,
        defaultFontWeight: defaultFontWeight,
        defaultTextColor: defaultTextColor,
      ),
      permanent: true,
    );
  }

  // EKRAN BOYUTLARI (gerçek cihaz boyutu)
  double get screenWidth => MediaQuery.of(AppSettings.instance.context!).size.width;
  double get screenHeight => MediaQuery.of(AppSettings.instance.context!).size.height;

  /// FIGMA’ya göre orantılı font büyüklüğü
  double getFontSize(double value) {
    return screenHeight * (value / _designHeight);
  }

  /// FIGMA px → responsive px
  double px(double value, Axis axisDirection) {
    if (axisDirection == Axis.horizontal) {
      return screenWidth * (value / _designWidth);
    } else {
      return screenHeight * (value / _designHeight);
    }
  }

  /// Boşluk için SizedBox
  Widget spacer(double value, Axis axisDirection) {
    return SizedBox(
      width: axisDirection == Axis.horizontal ? px(value, Axis.horizontal) : null,
      height: axisDirection == Axis.vertical ? px(value, Axis.vertical) : null,
    );
  }

  /// Padding helper'lar
  EdgeInsets paddingOnly({double left = 0, double top = 0, double right = 0, double bottom = 0}) {
    return EdgeInsets.only(left: px(left, Axis.horizontal), top: px(top, Axis.vertical), right: px(right, Axis.horizontal), bottom: px(bottom, Axis.vertical));
  }

  EdgeInsets paddingAll(double value) {
    return EdgeInsets.only(
      left: px(value, Axis.horizontal),
      top: px(value, Axis.vertical),
      right: px(value, Axis.horizontal),
      bottom: px(value, Axis.vertical),
    );
  }

  EdgeInsets paddingSymmetric({double vertical = 0, double horizontal = 0}) {
    return EdgeInsets.symmetric(vertical: px(vertical, Axis.vertical), horizontal: px(horizontal, Axis.horizontal));
  }

  /// Text style (GoogleFonts destekli)
  TextStyle style({
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    String? fontFamily, // custom font için
    String? googleFont, // GoogleFonts için family adı
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    TextOverflow? overflow,
  }) {
    // GoogleFonts kullanımı (öncelik: parametre → defaultFontFamily)
    if (googleFont != null || _defaultFontFamily != null) {
      return GoogleFonts.getFont(
        googleFont ?? _defaultFontFamily!,
        color: color ?? _defaultTextColor,
        backgroundColor: backgroundColor,
        fontSize: getFontSize(fontSize ?? 16),
        fontWeight: fontWeight ?? _defaultFontWeight,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        textBaseline: textBaseline,
        height: height,
        locale: locale,
        foreground: foreground,
        background: background,
        shadows: shadows,
        fontFeatures: fontFeatures,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
      );
    }

    return TextStyle(
      color: color ?? _getAdaptiveTextColor(),
      fontFamily: _defaultCustomFontFamily ?? fontFamily,
      backgroundColor: backgroundColor,
      fontSize: getFontSize(fontSize ?? 16),
      fontWeight: fontWeight ?? _defaultFontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      overflow: overflow,
    );
  }

  Color _getAdaptiveTextColor() {
    final context = AppSettings.instance.context;
    if (context == null) return _defaultTextColor ?? Colors.black;

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    if (_defaultTextColor != null) {
      return isDarkMode ? Colors.white : _defaultTextColor;
    }
    return isDarkMode ? Colors.white : Colors.black;
  }
}
