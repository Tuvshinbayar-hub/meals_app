import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters/page/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    Widget renderMealsItem() {
      void onTap() {
        Navigator.pop(context);
      }

      return InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SizedBox(
              width: 24,
            ),
            Icon(
              Icons.restaurant,
              size: 32,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              "Meals",
              style: TextStyle().copyWith(
                fontSize: 22,
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          ],
        ),
      );
    }

    Widget renderFilterItem() {
      void onTap() {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FiltersScreen(),
          ),
        );
      }

      return InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SizedBox(
              width: 24,
            ),
            Icon(
              Icons.settings,
              size: 32,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              "Filters",
              style: TextStyle().copyWith(
                fontSize: 22,
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          ],
        ),
      );
    }

    return Drawer(
      width: screenWidth * (3 / 4),
      backgroundColor: Theme.of(context).canvasColor,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary.withAlpha(180)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 40,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                Text(
                  'Configure your taste!',
                  style: TextStyle().copyWith(
                      fontSize: 22,
                      color: Theme.of(context).colorScheme.onPrimary),
                )
              ],
            ),
          ),
          SizedBox(
            height: 26,
          ),
          renderMealsItem(),
          SizedBox(
            height: 26,
          ),
          renderFilterItem(),
        ],
      ),
    );
  }
}
