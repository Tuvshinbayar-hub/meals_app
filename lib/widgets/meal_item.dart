import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_data.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.mealData});

  final MealData mealData;

  // void onTap(context) {
  //   Navigator.push(
  //       // context,
  //       // Router(routerDelegate: )
  //       );
  // }

  // --------- UI section ---------

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        onTap: () => {},
        child: Stack(
          children: [
            Expanded(
              child: Image.network(
                mealData.imageUrl,
              ),
            ),
            Text(
              mealData.title,
              style: TextStyle().copyWith(),
            ),
          ],
        ),
      ),
    );
  }
}
