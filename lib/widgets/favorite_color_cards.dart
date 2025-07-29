import 'package:flutter/material.dart';

/// A widget displaying a row of favorite color cards.
///
/// Each card is a rounded rectangle representing a color from
/// the [favoriteColors] list.
/// The currently active color is visually highlighted with
/// a white 60% transparent border.
/// Tapping a card triggers the [onColorTap] callback with the tapped color.
class FavoriteColorCards extends StatelessWidget {
  /// The list of favorite colors to display.
  final List<Color> favoriteColors;

  /// Callback invoked when a color card is tapped.
  ///
  /// The tapped color is passed as an argument.
  final void Function(Color) onColorTap;

  /// The currently active color that is used to highlight
  /// the corresponding card.
  final Color currentColor;

  /// Creates a [FavoriteColorCards] widget.
  ///
  /// All parameters are required.
  const FavoriteColorCards({
    required this.favoriteColors,
    required this.onColorTap,
    required this.currentColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: favoriteColors.map((color) {
        final isActive =
            ((color.a * 255).round() & 0xff) ==
                ((currentColor.a * 255).round() & 0xff) &&
            ((color.r * 255).round() & 0xff) ==
                ((currentColor.r * 255).round() & 0xff) &&
            ((color.g * 255).round() & 0xff) ==
                ((currentColor.g * 255).round() & 0xff) &&
            ((color.b * 255).round() & 0xff) ==
                ((currentColor.b * 255).round() & 0xff);

        return GestureDetector(
          onTap: () => onColorTap(color),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isActive ? Colors.white : Colors.transparent,
                width: isActive ? 3 : 2,
              ),
              boxShadow: isActive
                  ? [
                      const BoxShadow(
                        color: Color.fromARGB(153, 255, 255, 255),
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                    ]
                  : [],
            ),
            width: 50,
            height: 50,
          ),
        );
      }).toList(),
    );
  }
}
