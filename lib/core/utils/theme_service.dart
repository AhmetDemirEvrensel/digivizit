import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/app_colors.dart';

class ThemeService {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    ),
    scaffoldBackgroundColor: AppColors.background,
    shadowColor: Colors.black.withValues(alpha: 0.5),
    primaryColorLight: Colors.white.withValues(alpha: 0.3),
    primaryColorDark: Colors.black.withValues(alpha: 0.5),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.darkModeColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
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
