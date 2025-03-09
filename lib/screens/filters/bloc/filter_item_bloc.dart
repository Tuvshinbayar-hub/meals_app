import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/screens/filters/bloc/filter_item_event.dart';
import 'package:meals_app/screens/filters/bloc/filter_item_state.dart';

class FilterItemBloc extends Bloc<FilterItemEvent, FilterItemState> {
  FilterItemBloc() : super(FilterItemState()) {
    on<ToggleGlutenFree>(
      (event, emit) {
        print(state.isGlutenFree);
        emit(state.copyWith(isGlutenFree: !state.isGlutenFree));
      },
    );
    on<ToggleLactoseFree>(
      (event, emit) {
        emit(state.copyWith(isLactoseFree: !state.isLactoseFree));
      },
    );
    on<ToggleVegetarian>(
      (event, emit) {
        emit(state.copyWith(isVegetarian: !state.isVegetarian));
      },
    );
    on<ToggleVegan>(
      (event, emit) {
        emit(state.copyWith(isVegan: !state.isVegan));
      },
    );
  }
}
