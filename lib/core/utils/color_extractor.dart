import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

/// Utility class for extracting dominant colors from images
class ColorExtractor {
  /// Cache for extracted colors to avoid re-processing
  static final Map<String, Color> _colorCache = {};

  /// Extracts the dominant color from a network image URL
  /// Returns a default color if extraction fails
  static Future<Color> getDominantColorFromUrl(String imageUrl, {Color defaultColor = Colors.black}) async {
    // Check cache first
    if (_colorCache.containsKey(imageUrl)) {
      return _colorCache[imageUrl]!;
    }

    try {
      final ImageProvider imageProvider = NetworkImage(imageUrl);
      final PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
        imageProvider,
        size: const Size(100, 100), // Smaller size for faster processing
        maximumColorCount: 10,
      );

      // Try to get dominant color, fallback to vibrant, then muted
      Color? extractedColor = paletteGenerator.dominantColor?.color ?? paletteGenerator.vibrantColor?.color ?? paletteGenerator.mutedColor?.color;

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
  static Future<List<Color>> getPaletteFromUrl(String imageUrl, {int maxColors = 5}) async {
    try {
      final ImageProvider imageProvider = NetworkImage(imageUrl);
      final PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
        imageProvider,
        size: const Size(100, 100),
        maximumColorCount: maxColors,
      );

      return paletteGenerator.colors.toList();
    } catch (e) {
      debugPrint('ColorExtractor: Failed to extract palette from $imageUrl: $e');
      return [];
    }
  }

  /// Determines if a color is dark (for choosing text color)
  static bool isDarkColor(Color color) {
    // Using relative luminance formula
    final double luminance = (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;
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
  }
}
