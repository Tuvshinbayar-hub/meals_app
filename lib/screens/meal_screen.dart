import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/models/meal_data.dart';
import 'package:meals_app/screens/favorites/bloc/favorite_star_bloc.dart';
import 'package:meals_app/screens/favorites/bloc/favorite_star_event.dart';
import 'package:meals_app/screens/favorites/bloc/favorite_star_state.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.mealData});

  final MealData mealData;

  void onClickFavorite(FavoriteStarBloc bloc) {
    if (bloc.state.meals.contains(mealData)) {
      bloc.add(RemoveFromFavorites(mealData));
    } else {
      bloc.add(AddToFavorites(mealData));
    }
  }

  Widget renderFavoriteStar(BuildContext context) {
    IconData iconData = Icons.star_border;

    final favoriteStarBloc = context.read<FavoriteStarBloc>();
    if (favoriteStarBloc.state.meals.contains(mealData)) {
      iconData = Icons.stars_outlined;
    }

    return InkWell(
      onTap: () {
        onClickFavorite(favoriteStarBloc);
      },
      child: Icon(iconData),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteStarBloc, FavoriteStarState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(mealData.title),
          actions: [renderFavoriteStar(context)],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 250,
                child: Image.network(
                  mealData.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Ingredients',
                style: TextStyle()
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              SizedBox(
                height: 16,
              ),
              for (var ingredient in mealData.ingredients)
                Text(
                  ingredient,
                  style: TextStyle().copyWith(color: Colors.white),
                ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Steps',
                style: TextStyle().copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var step in mealData.steps)
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Text(step,
                            style: TextStyle().copyWith(color: Colors.white)),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
