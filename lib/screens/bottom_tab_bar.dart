import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites/page/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabBar();
  }
}

class _TabBar extends State<BottomTabBar> {
  Widget selectedScreen = CategoriesScreen();
  String selectedTitle = 'Choose category';
  int selectedScreenIndex = 0;

  void onTab(index) {
    setState(() {
      selectedScreenIndex = index;
      selectedScreen = index == 0 ? CategoriesScreen() : FavoritesScreen();
      selectedTitle = index == 0 ? 'Choose category' : 'Favorites';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(selectedTitle)),
      body: selectedScreen,
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTab,
          currentIndex: selectedScreenIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
          ]),
    );
  }
}
