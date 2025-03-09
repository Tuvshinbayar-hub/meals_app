import 'package:meals_app/models/meal_data.dart';

abstract class FavoriteStarEvent {}

class RemoveFromFavorites extends FavoriteStarEvent {
  RemoveFromFavorites(this.meal);

  final MealData meal;
}

class AddToFavorites extends FavoriteStarEvent {
  AddToFavorites(this.meal);

  final MealData meal;
}
