import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category_item_data.dart';
import 'package:meals_app/models/meal_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, required this.categoryItemData});

  final CategoryItemData categoryItemData;
  List<MealData> get filteredMeals {
    return dummyMealDatas
        .where(
          (item) => item.categories.contains(categoryItemData.id),
        )
        .toList();
  }

  bool hasData() {
    return filteredMeals.isEmpty == false;
  }

  // --------- UI SECTION ---------

  Widget renderListView() {
    return Stack(
      children: [
        ListView.builder(
            itemCount: filteredMeals.length,
            itemBuilder: (context, index) =>
                MealItem(mealData: filteredMeals[index]))
      ],
    );
  }

  Widget renderException() {
    return Text(
      'No valid data found',
      style: TextStyle().copyWith(color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryItemData.name),
        ),
        body: hasData() ? renderListView() : renderException());
  }
}
