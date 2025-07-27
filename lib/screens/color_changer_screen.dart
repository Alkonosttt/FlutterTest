import 'package:flutter/material.dart';
import 'package:fluttertest/services/color_service.dart';
import 'package:fluttertest/widgets/favourite_color_cards.dart';

class ColorChangerScreen extends StatefulWidget {
  const ColorChangerScreen({super.key});

  @override
  State<ColorChangerScreen> createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  Color _backgroundColor = Colors.red;
  final int _maxFavorites = 3;
  final List<Color> _favoriteColors = [];

  void _changeColor() {
    setState(() {
      _backgroundColor = ColorService.generateRandomColor();
    });
  }

  void _addToFavorites() {
    setState(() {
      _favoriteColors.insert(0, _backgroundColor);
      if (_favoriteColors.length > _maxFavorites) {
        _favoriteColors.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final complementary = ColorService.getComplementaryColor(_backgroundColor);
    final backgroundHex = ColorService.colorToHex(_backgroundColor);
    final complementaryHex = ColorService.colorToHex(complementary);

    return GestureDetector(
      onTap: _changeColor,
      child: Scaffold(
        backgroundColor: _backgroundColor,
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Hello there',
                    style: TextStyle(
                      fontSize: 32,
                      color: complementary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (_favoriteColors.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    FavoriteColorCards(favoriteColors: _favoriteColors),
                  ],
                ],
              ),
            ),
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          '🌝 Background $backgroundHex',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Text(
                          '🌚 Complementary $complementaryHex',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: _addToFavorites,
                child: const Icon(Icons.favorite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
