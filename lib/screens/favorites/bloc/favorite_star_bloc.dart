import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/screens/favorites/bloc/favorite_star_event.dart';
import 'package:meals_app/screens/favorites/bloc/favorite_star_state.dart';
import 'package:meals_app/models/meal_data.dart';

class FavoriteStarBloc extends Bloc<FavoriteStarEvent, FavoriteStarState> {
  FavoriteStarBloc() : super(FavoriteStarState([])) {
    on<AddToFavorites>(
      (event, emit) {
        final updatedMeals = List<MealData>.from(state.meals)..add(event.meal);
        emit(FavoriteStarState(updatedMeals));
      },
    );
    on<RemoveFromFavorites>((event, emit) {
      final updatedMeals = List<MealData>.from(state.meals);

      updatedMeals.remove(event.meal);
      emit(FavoriteStarState(updatedMeals));
    });
  }
}
