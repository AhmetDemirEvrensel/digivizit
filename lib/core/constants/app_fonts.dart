import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/global_initializer.dart';

///
/// Usage:
/// - Default style: `style: AppFonts.smBold` (getter)
/// - Custom style: `style: AppFonts.smBold.copyWith(fontSize: 16)` (extension)
/// - Or use builder: `style: AppFonts.style(AppFontsEnum.smBold, fontSize: 16)`
class AppFonts {
  AppFonts._();

  // ==================== XS Styles (10px) ====================
  static TextStyle get xsRegular => appSizer.style(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    height: 1.4,
    color: AppColors.baseWhite,
  );

  static TextStyle get xsSemibold => appSizer.style(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: AppColors.baseWhite,
  );

  static TextStyle get xsBold => appSizer.style(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    height: 1.4,
    color: AppColors.baseWhite,
  );

  // ==================== SM Styles (12px) ====================
  static TextStyle get smRegular => appSizer.style(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    height: 1.33333,
    color: AppColors.baseWhite,
  );

  static TextStyle get smSemibold => appSizer.style(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    height: 1.33333,
    color: AppColors.baseWhite,
  );

  static TextStyle get smBold => appSizer.style(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    height: 1.33333,
    color: AppColors.baseWhite,
  );

  // ==================== Base Styles (14px) ====================
  static TextStyle get baseRegular => appSizer.style(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.42857,
    color: AppColors.baseWhite,
  );

  static TextStyle get baseSemibold => appSizer.style(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.42857,
    color: AppColors.baseWhite,
  );

  static TextStyle get baseBold => appSizer.style(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    height: 1.42857,
    color: AppColors.baseWhite,
  );

  // ==================== Base Styles (15px) ====================
  static TextStyle get base2Regular => appSizer.style(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    height: 1.42857,
    color: AppColors.baseWhite,
  );

  static TextStyle get base2Semibold => appSizer.style(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    height: 1.42857,
    color: AppColors.baseWhite,
  );

  static TextStyle get base2Bold => appSizer.style(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    height: 1.42857,
    color: AppColors.baseWhite,
  );

  // ==================== LG Styles (16px) ====================
  static TextStyle get lgRegular => appSizer.style(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.5,
    color: AppColors.baseWhite,
  );

  static TextStyle get lgSemibold => appSizer.style(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: AppColors.baseWhite,
  );

  static TextStyle get lgBold => appSizer.style(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 1.5,
    color: AppColors.baseWhite,
  );

  // ==================== LG Styles (18px) ====================
  static TextStyle get lg2Regular => appSizer.style(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    height: 1.5,
    color: AppColors.baseWhite,
  );

  static TextStyle get lg2Semibold => appSizer.style(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: AppColors.baseWhite,
  );

  static TextStyle get lg2Bold => appSizer.style(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    height: 1.5,
    color: AppColors.baseWhite,
  );

  // ==================== H4 Styles (20px) ====================
  static TextStyle get xlRegular => appSizer.style(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    height: 1.44444,
    color: AppColors.baseWhite,
  );

  static TextStyle get xlSemibold => appSizer.style(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.44444,
    color: AppColors.baseWhite,
  );

  static TextStyle get xlBold => appSizer.style(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    height: 1.44444,
    color: AppColors.baseWhite,
  );

  // ==================== H3 Styles (24px) ====================
  static TextStyle get xl2Regular => appSizer.style(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    height: 1.33333,
    color: AppColors.baseWhite,
  );

  static TextStyle get xl2Semibold => appSizer.style(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.33333,
    color: AppColors.baseWhite,
  );

  static TextStyle get xl2Bold => appSizer.style(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    height: 1.33333,
    color: AppColors.baseWhite,
  );

  // ==================== H2 Styles (28px) ====================
  static TextStyle get xl3Regular => appSizer.style(
    fontSize: 28,
    fontWeight: FontWeight.normal,
    height: 1.28571,
    color: AppColors.baseWhite,
  );

  static TextStyle get xl3Semibold => appSizer.style(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.28571,
    color: AppColors.baseWhite,
  );

  static TextStyle get xl3Bold => appSizer.style(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    height: 1.28571,
    color: AppColors.baseWhite,
  );
}

/// Extension to easily customize AppFonts styles
///
/// Usage: `AppFonts.smBold.withColor(Colors.white).withSize(14)`
extension AppFontsExtension on TextStyle {
  /// Change color
  TextStyle withColor(Color color) => copyWith(color: color);

  /// Change font size
  TextStyle withSize(double fontSize) => copyWith(fontSize: fontSize);

  /// Change letter spacing
  TextStyle withLetterSpacing(double letterSpacing) =>
      copyWith(letterSpacing: letterSpacing);

  /// Change line height
  TextStyle withHeight(double height) => copyWith(height: height);

  /// Change font weight
  TextStyle withWeight(FontWeight fontWeight) =>
      copyWith(fontWeight: fontWeight);

  /// Add text decoration
  TextStyle withDecoration(TextDecoration decoration) =>
      copyWith(decoration: decoration);

  /// Customize multiple properties at once
  TextStyle customize({
    Color? color,
    double? fontSize,
    double? letterSpacing,
    double? height,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) => copyWith(
    color: color,
    fontSize: fontSize,
    letterSpacing: letterSpacing,
    height: height,
    fontWeight: fontWeight,
    decoration: decoration,
  );
}
