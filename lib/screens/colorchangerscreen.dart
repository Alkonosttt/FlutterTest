import 'dart:math';
import 'package:flutter/material.dart';

class ColorChangerScreen extends StatefulWidget {
  const ColorChangerScreen({super.key});

  @override
  State<ColorChangerScreen> createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  Color _backgroundColor = Colors.red;
  final int _colorConstant = 256;

  void _changeColor() {
    final random = Random();
    setState(() {
      _backgroundColor = Color.fromARGB(
        _colorConstant - 1,
        random.nextInt(_colorConstant),
        random.nextInt(_colorConstant),
        random.nextInt(_colorConstant),
      );
    });
  }

  String _colorToHex(Color color) {
    int r = (color.r * 255.0).round() & 0xff;
    int g = (color.g * 255.0).round() & 0xff;
    int b = (color.b * 255.0).round() & 0xff;

    return '#${r.toRadixString(16).padLeft(2, '0')}${g.toRadixString(16).padLeft(2, '0')}${b.toRadixString(16).padLeft(2, '0')}'
        .toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: Scaffold(
        backgroundColor: _backgroundColor,
        body: Stack(
          children: [
            Center(
              child: Text(
                'Hello there',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black.withAlpha(50),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(child: Text(_colorToHex(_backgroundColor))),
            ),
          ],
        ),
      ),
    );
  }
}
