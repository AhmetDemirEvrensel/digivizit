import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

/// Utility class for extracting dominant colors from images
class ColorExtractor {
  /// Cache for extracted colors to avoid re-processing
  static final Map<String, Color> _colorCache = {};
  static final Map<String, ({Color topColor, Color bottomColor})>
  _gradientCache = {};

  /// Extracts the dominant color from a network image URL
  /// Returns a default color if extraction fails
  static Future<Color> getDominantColorFromUrl(
    String imageUrl, {
    Color defaultColor = Colors.black,
  }) async {
    // Check cache first
    if (_colorCache.containsKey(imageUrl)) {
      return _colorCache[imageUrl]!;
    }

    try {
      final ImageProvider imageProvider = NetworkImage(imageUrl);
      final PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(
            imageProvider,
            size: const Size(100, 100), // Smaller size for faster processing
            maximumColorCount: 10,
          );

      // Try to get dominant color, fallback to vibrant, then muted
      Color? extractedColor =
          paletteGenerator.dominantColor?.color ??
          paletteGenerator.vibrantColor?.color ??
          paletteGenerator.mutedColor?.color;

      if (extractedColor != null) {
        _colorCache[imageUrl] = extractedColor;
        return extractedColor;
      }
    } catch (e) {
      debugPrint('ColorExtractor: Failed to extract color from $imageUrl: $e');
    }

    return defaultColor;
  }

  /// Extracts multiple colors (palette) from a network image URL
  static Future<List<Color>> getPaletteFromUrl(
    String imageUrl, {
    int maxColors = 5,
  }) async {
    try {
      final ImageProvider imageProvider = NetworkImage(imageUrl);
      final PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(
            imageProvider,
            size: const Size(100, 100),
            maximumColorCount: maxColors,
          );

      return paletteGenerator.colors.toList();
    } catch (e) {
      debugPrint(
        'ColorExtractor: Failed to extract palette from $imageUrl: $e',
      );
      return [];
    }
  }

  /// Extracts two colors suitable for a background gradient from a network image
  static Future<({Color topColor, Color bottomColor})> getGradientColorsFromUrl(
    String imageUrl, {
    Color topFallback = const Color(0xFF2D1B69),
    Color bottomFallback = const Color(0xFF1A0F3D),
  }) async {
    if (_gradientCache.containsKey(imageUrl)) {
      return _gradientCache[imageUrl]!;
    }

    try {
      final ImageProvider imageProvider = NetworkImage(imageUrl);
      final PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(
            imageProvider,
            size: const Size(120, 120),
            maximumColorCount: 12,
          );

      final Color? dominantColor = paletteGenerator.dominantColor?.color;
      final Color? vibrantColor = paletteGenerator.vibrantColor?.color;
      final Color? darkVibrantColor = paletteGenerator.darkVibrantColor?.color;
      final Color? mutedColor = paletteGenerator.mutedColor?.color;
      final Color? darkMutedColor = paletteGenerator.darkMutedColor?.color;

      final Color primaryColor =
          dominantColor ?? vibrantColor ?? mutedColor ?? topFallback;
      final Color secondarySource =
          darkVibrantColor ??
          darkMutedColor ??
          mutedColor ??
          vibrantColor ??
          primaryColor;

      final gradient = (
        topColor: _lightenColor(primaryColor, 0.08),
        bottomColor: _darkenColor(secondarySource, 0.28),
      );

      _gradientCache[imageUrl] = gradient;
      return gradient;
    } catch (e) {
      debugPrint(
        'ColorExtractor: Failed to extract gradient colors from $imageUrl: $e',
      );
    }

    return (topColor: topFallback, bottomColor: bottomFallback);
  }

  /// Determines if a color is dark (for choosing text color)
  static bool isDarkColor(Color color) {
    // Using relative luminance formula
    final red = (color.r * 255.0).round().clamp(0, 255);
    final green = (color.g * 255.0).round().clamp(0, 255);
    final blue = (color.b * 255.0).round().clamp(0, 255);
    final double luminance = (0.299 * red + 0.587 * green + 0.114 * blue) / 255;
    return luminance < 0.5;
  }

  /// Returns appropriate text color (white or black) based on background
  static Color getContrastingTextColor(Color backgroundColor) {
    return isDarkColor(backgroundColor) ? Colors.white : Colors.black;
  }

  /// Clears the color cache
  static void clearCache() {
    _colorCache.clear();
  }

  /// Removes a specific URL from cache
  static void removeFromCache(String imageUrl) {
    _colorCache.remove(imageUrl);
    _gradientCache.remove(imageUrl);
  }

  static Color _lightenColor(Color color, double amount) {
    final hslColor = HSLColor.fromColor(color);
    return hslColor
        .withLightness((hslColor.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  static Color _darkenColor(Color color, double amount) {
    final hslColor = HSLColor.fromColor(color);
    return hslColor
        .withLightness((hslColor.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }
}
