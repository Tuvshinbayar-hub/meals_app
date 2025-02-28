import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/categories.dart';

final kColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark, seedColor: Color.fromARGB(156, 210, 152, 0));

final theme = ThemeData(
  colorScheme: kColorScheme,
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Categories(),
    );
  }
}
