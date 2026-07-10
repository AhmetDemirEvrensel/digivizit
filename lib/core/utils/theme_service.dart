import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/app_colors.dart';

class ThemeService {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Inter',
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary500,
      brightness: Brightness.light,
      primary: AppColors.primary500,
      surface: AppColors.baseWhite,
      error: AppColors.negative500,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.baseWhite,
      modalBackgroundColor: AppColors.baseWhite,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      modalElevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
    ),
    scaffoldBackgroundColor: AppColors.surface,
    canvasColor: AppColors.surface,
    dividerColor: AppColors.hairline,
    shadowColor: AppColors.ink.withValues(alpha: 0.08),
    splashColor: AppColors.primary500.withValues(alpha: 0.08),
    highlightColor: AppColors.primary500.withValues(alpha: 0.04),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surface,
      foregroundColor: AppColors.ink,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: AppColors.ink),
      titleTextStyle: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.ink,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      labelStyle: const TextStyle(color: AppColors.inkSoft),
      hintStyle: const TextStyle(color: AppColors.inkFaint),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.hairline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.hairline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.primary500, width: 1.5),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primary500,
        foregroundColor: AppColors.baseWhite,
        disabledBackgroundColor: AppColors.surfaceAlt,
        disabledForegroundColor: AppColors.inkFaint,
        textStyle: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary600,
        textStyle: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Inter',
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.darkModeColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
    ),
    scaffoldBackgroundColor: AppColors.darkModeColor,
    shadowColor: Colors.black,
    primaryColorLight: Colors.white.withValues(alpha: 0.3),
    primaryColorDark: Colors.black,
  );

  // Tema bazlı renk tanımlamaları:
  static const Color defaultLightTextColor = Colors.black;
  static const Color defaultDarkTextColor = Colors.white;

  static const Color defaultLightBackgroundColor = Colors.white;
  static const Color defaultDarkBackgroundColor = Colors.black;
}
