import 'package:flutter/material.dart';

class FavoriteColorCards extends StatelessWidget {
  final List<Color> favoriteColors;

  const FavoriteColorCards({required this.favoriteColors, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: favoriteColors
          .map(
            (color) => Container(
              width: 60,
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black12),
              ),
            ),
          )
          .toList(),
    );
  }
}
