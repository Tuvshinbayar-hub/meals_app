import 'package:flutter/material.dart';
import 'package:meals_app/models/category_item_data.dart';
import 'package:meals_app/screens/meals.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({required this.categoryItemData, super.key});
  final CategoryItemData categoryItemData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Meals(categoryItemData: categoryItemData),
            ));
      },
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        decoration: BoxDecoration(
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
                    fontFamily:
                        Theme.of(context).textTheme.labelLarge!.fontFamily))),
      ),
    );
  }
}
