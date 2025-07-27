import 'package:flutter/material.dart';
import 'package:fluttertest/screens/color_changer_screen.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ColorChangerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
