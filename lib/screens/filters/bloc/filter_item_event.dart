abstract class FilterItemEvent {}

class ToggleGlutenFree extends FilterItemEvent {
  ToggleGlutenFree({this.isOn = false});
  final bool isOn;
}

class ToggleLactoseFree extends FilterItemEvent {
  ToggleLactoseFree({this.isOn = false});
  final bool isOn;
}

class ToggleVegetarian extends FilterItemEvent {
  ToggleVegetarian({this.isOn = false});
  final bool isOn;
}

class ToggleVegan extends FilterItemEvent {
  ToggleVegan({this.isOn = false});
  final bool isOn;
}
