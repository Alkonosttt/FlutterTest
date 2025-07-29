import 'package:flutter/material.dart';
import 'package:fluttertest/screens/color_changer_screen.dart';

/// Entry point of the Flutter application
void main() {
  runApp(const Main());
}

/// The root widget of the application.
///
/// This widget sets up the [MaterialApp] and disables the debug banner.
/// It loads the [ColorChangerScreen] as the home screen.
class Main extends StatelessWidget {
  /// Creates an instance of the [Main] widget.
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ColorChangerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
