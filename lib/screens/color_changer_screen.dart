import 'package:flutter/material.dart';
import 'package:fluttertest/services/color_service.dart';
import 'package:fluttertest/widgets/favorite_color_cards.dart';

/// A screen that displays a tappable area that changes the background color.
///
/// It also generates the complementary color, the current color's hex code,
/// and allows the user to add the current color to a list of favorite colors,
/// which functions like a stack, last in, first out.
class ColorChangerScreen extends StatefulWidget {
  /// Creates the [ColorChangerScreen] widget.
  const ColorChangerScreen({super.key});

  @override
  State<ColorChangerScreen> createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  Color _backgroundColor = Colors.red;
  final int _maxFavorites = 3;
  final List<Color> _favoriteColors = [];

  /// Changes the background color to a randomly generated color.
  void _changeColor() {
    setState(() {
      _backgroundColor = ColorService.generateRandomColor();
    });
  }

  /// Adds the current background color to the favorites list.
  ///
  /// Saves only 3 of the most recent [_maxFavorites] items.
  void _addToFavorites() {
    setState(() {
      _favoriteColors.insert(0, _backgroundColor);
      if (_favoriteColors.length > _maxFavorites) {
        _favoriteColors.removeLast();
      }
    });
  }

  /// Sets the background color to the specified [color].
  void _setBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
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
                    FavoriteColorCards(
                      favoriteColors: _favoriteColors,
                      onColorTap: _setBackgroundColor,
                      currentColor: _backgroundColor,
                    ),
                  ],
                ],
              ),
            ),
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Center(
                /// Displays the hex codes of the current background color
                /// and its complementary color.
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
