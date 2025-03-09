import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category_item_data.dart';
import 'package:meals_app/models/meal_data.dart';
import 'package:meals_app/screens/favorites/bloc/favorite_star_bloc.dart';
import 'package:meals_app/screens/favorites/bloc/favorite_star_state.dart';
import 'package:meals_app/screens/filters/bloc/filter_item_bloc.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.categoryItemData});

  final CategoryItemData? categoryItemData;

  List<MealData> getFilteredMeals(BuildContext context) {
    final filterItemBloc = context.read<FilterItemBloc>();

    if (categoryItemData == null) {
      final favoriteStarBloc = context.read<FavoriteStarBloc>();
      return favoriteStarBloc.state.meals;
    }

    List<MealData> filteredMeals = List.of(dummyMealDatas);

    filteredMeals = _applyFilters(filterItemBloc, filteredMeals);

    return filteredMeals
        .where(
          (item) => item.categories.contains(categoryItemData!.id),
        )
        .toList();
  }

  List<MealData> _applyFilters(FilterItemBloc filterItemBloc, data) {
    if (filterItemBloc.state.isGlutenFree) {
      data = data
          .where(
              (item) => item.isGlutenFree == filterItemBloc.state.isGlutenFree)
          .toList();
    }

    if (filterItemBloc.state.isLactoseFree) {
      data = data
          .where((item) =>
              item.isLactoseFree == filterItemBloc.state.isLactoseFree)
          .toList();
    }

    if (filterItemBloc.state.isVegetarian) {
      data = data
          .where(
              (item) => item.isVegetarian == filterItemBloc.state.isVegetarian)
          .toList();
    }

    if (filterItemBloc.state.isVegan) {
      data = data
          .where((item) => item.isVegan == filterItemBloc.state.isVegan)
          .toList();
    }
    return data;
  }

  bool hasData(context) {
    return getFilteredMeals(context).isEmpty == false;
  }

  // --------- UI SECTION ---------

  void onSelectionMealItem(context, mealData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealScreen(mealData: mealData),
      ),
    );
  }

  Widget renderListView(context) {
    return BlocBuilder<FavoriteStarBloc, FavoriteStarState>(
      builder: (context, state) => Stack(
        children: [
          ListView.builder(
              itemCount: getFilteredMeals(context).length,
              itemBuilder: (context, index) => MealItem(
                    mealData: getFilteredMeals(context)[index],
                    onSelection: onSelectionMealItem,
                  ))
        ],
      ),
    );
  }

  Widget renderException() {
    return Center(
      child: Text(
        'No valid data found',
        style: TextStyle().copyWith(color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (categoryItemData == null) {
      return hasData(context) ? renderListView(context) : renderException();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryItemData!.name),
        ),
        body: hasData(context) ? renderListView(context) : renderException());
  }
}
