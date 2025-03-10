import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/models/meal_data.dart';
import 'package:meals_app/screens/favorites/bloc/favorite_star_bloc.dart';
import 'package:meals_app/screens/favorites/bloc/favorite_star_event.dart';
import 'package:meals_app/screens/favorites/bloc/favorite_star_state.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({super.key, required this.mealData});

  final MealData mealData;

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  void onClickFavorite(FavoriteStarBloc bloc) {
    if (bloc.state.meals.contains(widget.mealData)) {
      bloc.add(RemoveFromFavorites(widget.mealData));
    } else {
      bloc.add(AddToFavorites(widget.mealData));
    }
  }

  Widget renderFavoriteStar(BuildContext context) {
    IconData iconData = Icons.star_border;

    final favoriteStarBloc = context.read<FavoriteStarBloc>();
    if (favoriteStarBloc.state.meals.contains(widget.mealData)) {
      iconData = Icons.star;
    }

    return InkWell(
      onTap: () {
        onClickFavorite(favoriteStarBloc);
      },
      borderRadius: BorderRadius.circular(32),
      child: Padding(
          padding: EdgeInsets.all(4),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => ScaleTransition(
              // scale: animation,
              scale: Tween(begin: 0.0, end: 1.0).animate(animation),
              child: child,
            ),
            child: Icon(
              key: ValueKey(iconData),
              iconData,
              size: 32,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteStarBloc, FavoriteStarState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(widget.mealData.title),
          actions: [renderFavoriteStar(context)],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 250,
                child: Hero(
                    tag: widget.mealData.id,
                    child: Image.network(
                      widget.mealData.imageUrl,
                      fit: BoxFit.cover,
                    )),
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
              for (var ingredient in widget.mealData.ingredients)
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
                    for (var step in widget.mealData.steps)
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
