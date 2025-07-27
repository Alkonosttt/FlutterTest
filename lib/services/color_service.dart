import 'dart:math';
import 'package:flutter/material.dart';

class ColorService {
  static const int _colorMax = 256;

  static Color generateRandomColor() {
    final random = Random();

    return Color.fromARGB(
      _colorMax - 1,
      random.nextInt(_colorMax),
      random.nextInt(_colorMax),
      random.nextInt(_colorMax),
    );
  }

  static String colorToHex(Color color) {
    final int r = (color.r * 255.0).round() & 0xff;
    final int g = (color.g * 255.0).round() & 0xff;
    final int b = (color.b * 255.0).round() & 0xff;

    return '#${r.toRadixString(16).padLeft(2, '0')}${g.toRadixString(16).padLeft(2, '0')}${b.toRadixString(16).padLeft(2, '0')}'
        .toUpperCase();
  }

  static Color getComplementaryColor(Color color) {
    return Color.fromARGB(
      (color.a * (_colorMax - 1)).round(),
      _colorMax - 1 - (color.r * (_colorMax - 1)).round(),
      _colorMax - 1 - (color.g * (_colorMax - 1)).round(),
      _colorMax - 1 - (color.b * (_colorMax - 1)).round(),
    );
  }
}
