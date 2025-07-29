import 'dart:math';
import 'package:flutter/material.dart';

/// Provides the utility functions related to color generation and manipulation.
class ColorService {
  static const int _colorMax = 256;

  /// Generates a random [Color].
  ///
  /// Returns a [Color] with full opacity and random RGB values.
  static Color generateRandomColor() {
    final random = Random();

    return Color.fromARGB(
      _colorMax - 1,
      random.nextInt(_colorMax),
      random.nextInt(_colorMax),
      random.nextInt(_colorMax),
    );
  }

  /// Converts a [Color] to its hexadecimal string representation.
  ///
  /// The returned string has the format #RRGGBB, uppercase.
  /// Uses the red, green, and blue components of the [color].
  static String colorToHex(Color color) {
    const int hexPaddLength = 2;
    const String hexPaddChar = '0';
    const int hexRadix = 16;

    final int r = (color.r * 255.0).round() & 0xff;
    final int g = (color.g * 255.0).round() & 0xff;
    final int b = (color.b * 255.0).round() & 0xff;

    return '#'
            '${r.toRadixString(hexRadix).padLeft(hexPaddLength, hexPaddChar)}'
            '${g.toRadixString(hexRadix).padLeft(hexPaddLength, hexPaddChar)}'
            '${b.toRadixString(hexRadix).padLeft(hexPaddLength, hexPaddChar)}'
        .toUpperCase();
  }

  /// Returns the complementary color of the given [color].
  ///
  /// The complementary color inverts the RGB values.
  static Color getComplementaryColor(Color color) {
    return Color.fromARGB(
      (color.a * (_colorMax - 1)).round(),
      _colorMax - 1 - (color.r * (_colorMax - 1)).round(),
      _colorMax - 1 - (color.g * (_colorMax - 1)).round(),
      _colorMax - 1 - (color.b * (_colorMax - 1)).round(),
    );
  }
}
