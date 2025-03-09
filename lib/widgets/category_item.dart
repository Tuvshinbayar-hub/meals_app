import 'package:flutter/material.dart';
import 'package:meals_app/models/category_item_data.dart';
import 'package:meals_app/screens/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({required this.categoryItemData, super.key});
  final CategoryItemData categoryItemData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MealsScreen(categoryItemData: categoryItemData),
        ));
      },
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          gradient: LinearGradient(colors: [
            categoryItemData.color.withAlpha(120),
            categoryItemData.color.withAlpha(200),
          ], begin: Alignment.topLeft, end: Alignment.center),
        ),
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(categoryItemData.name,
                style: TextStyle().copyWith(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily:
                        Theme.of(context).textTheme.labelLarge!.fontFamily))),
      ),
    );
  }
}
