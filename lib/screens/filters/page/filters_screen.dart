import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/screens/filters/bloc/filter_item_bloc.dart';
import 'package:meals_app/screens/filters/bloc/filter_item_event.dart';
import 'package:meals_app/widgets/filter_item.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final filterItemBloc = context.read<FilterItemBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Column(
        children: [
          FilterItem(
            title: 'Gluten free',
            onToggle: () {
              filterItemBloc.add(ToggleGlutenFree());
            },
            isOn: filterItemBloc.state.isGlutenFree,
          ),
          FilterItem(
            title: 'Lactose free',
            onToggle: () {
              filterItemBloc.add(ToggleLactoseFree());
            },
            isOn: filterItemBloc.state.isLactoseFree,
          ),
          FilterItem(
            title: 'Vegetarian',
            onToggle: () {
              filterItemBloc.add(ToggleVegetarian());
            },
            isOn: filterItemBloc.state.isVegetarian,
          ),
          FilterItem(
            title: 'Vegan',
            onToggle: () {
              filterItemBloc.add(ToggleVegan());
            },
            isOn: filterItemBloc.state.isVegan,
          )
        ],
      ),
    );
  }
}
