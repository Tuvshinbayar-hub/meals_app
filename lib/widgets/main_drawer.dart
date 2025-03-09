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
              Icons.food_bank_sharp,
              size: 32,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              "Meals",
              style: TextStyle().copyWith(
                fontSize: 22,
                color: Theme.of(context).primaryTextTheme.bodyLarge!.color,
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
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              "Filters",
              style: TextStyle().copyWith(
                fontSize: 22,
                color: Theme.of(context).primaryTextTheme.bodyLarge!.color,
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
          // DrawerHeader(
          //     child: Row(
          //   children: [
          //     Icon(
          //       Icons.fastfood,
          //       size: 40,
          //       color: Theme.of(context).colorScheme.onPrimary,
          //     ),
          //     Text(
          //       'Configure your taste!',
          //       style: TextStyle().copyWith(
          //           fontSize: 22,
          //           color: Theme.of(context).colorScheme.onPrimary),
          //     )
          //   ],
          // )),
          Container(
            height: 200,
            color: Theme.of(context).colorScheme.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
