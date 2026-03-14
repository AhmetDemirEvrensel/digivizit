import 'package:flutter/material.dart';

extension ColorExtension on Color {
  /// Darkens the color by reducing the lightness in HSL color space
  /// [amount] should be between 0.0 and 1.0
  /// Example: color.darken(0.3) makes the color 30% darker
  Color darken([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1, 'Amount must be between 0 and 1');
    final hsl = HSLColor.fromColor(this);
    final newLightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(newLightness).toColor();
  }

  /// Lightens the color by increasing the lightness in HSL color space
  /// [amount] should be between 0.0 and 1.0
  /// Example: color.lighten(0.3) makes the color 30% lighter
  Color lighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1, 'Amount must be between 0 and 1');
    final hsl = HSLColor.fromColor(this);
    final newLightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(newLightness).toColor();
  }
}
