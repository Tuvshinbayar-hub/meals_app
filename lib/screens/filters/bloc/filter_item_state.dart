class FilterItemState {
  FilterItemState(
      {this.isGlutenFree = false,
      this.isLactoseFree = false,
      this.isVegetarian = false,
      this.isVegan = false});
  bool isGlutenFree;
  bool isLactoseFree;
  bool isVegetarian;
  bool isVegan;

  FilterItemState copyWith({
    bool? isGlutenFree,
    bool? isLactoseFree,
    bool? isVegetarian,
    bool? isVegan,
  }) {
    return FilterItemState(
      isGlutenFree: isGlutenFree ?? this.isGlutenFree,
      isLactoseFree: isLactoseFree ?? this.isLactoseFree,
      isVegetarian: isVegetarian ?? this.isVegetarian,
      isVegan: isVegan ?? this.isVegan,
    );
  }
}
