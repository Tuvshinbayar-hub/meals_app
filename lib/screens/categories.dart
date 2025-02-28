import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/data/dummy_data.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});
  final _availableCategories = availableCategories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Category'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) =>
              CategoryItem(categoryItemData: availableCategories[index]),
          itemCount: _availableCategories.length,
        ),
      ),
    );
  }
}
