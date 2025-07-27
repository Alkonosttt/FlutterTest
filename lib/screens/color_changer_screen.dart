import 'package:flutter/material.dart';
import 'package:fluttertest/services/color_service.dart';

class ColorChangerScreen extends StatefulWidget {
  const ColorChangerScreen({super.key});

  @override
  State<ColorChangerScreen> createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  Color _backgroundColor = Colors.red;

  void _changeColor() {
    setState(() {
      _backgroundColor = ColorService.generateRandomColor();
    });
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
                  color: ColorService.getComplementaryColor(_backgroundColor),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      '🌝 Background ${ColorService.colorToHex(_backgroundColor)}\n🌚 Complementary ${ColorService.colorToHex(ColorService.getComplementaryColor(_backgroundColor))}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
