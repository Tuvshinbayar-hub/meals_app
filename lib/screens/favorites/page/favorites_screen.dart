import 'package:flutter/material.dart';
import 'package:meals_app/screens/meals_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() {
    return _FavoritesScreen();
  }
}

class _FavoritesScreen extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return MealsScreen();
  }
}
