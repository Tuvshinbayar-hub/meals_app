import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/screens/filters/bloc/filter_item_bloc.dart';
import 'package:meals_app/screens/filters/bloc/filter_item_state.dart';

class FilterItem extends StatefulWidget {
  const FilterItem(
      {super.key,
      required this.title,
      required this.onToggle,
      required this.isOn});
  final String title;

  final Function onToggle;

  final bool isOn;

  @override
  State<FilterItem> createState() => _FilterSwitch();
}

class _FilterSwitch extends State<FilterItem> {
  static const WidgetStateProperty<Icon> thumbIcon =
      WidgetStateProperty<Icon>.fromMap(
    <WidgetStatesConstraint, Icon>{
      WidgetState.selected: Icon(Icons.check),
      WidgetState.any: Icon(Icons.close),
    },
  );

  bool isOn = false;

  @override
  void initState() {
    isOn = widget.isOn;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterItemBloc, FilterItemState>(
      builder: (context, state) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 46, vertical: 12),
        child: Row(
          children: [
            Text(
              widget.title,
              style: TextStyle().copyWith(
                  fontSize:
                      Theme.of(context).primaryTextTheme.bodyLarge!.fontSize,
                  color: Theme.of(context).primaryTextTheme.bodyLarge!.color),
            ),
            Spacer(),
            Switch(
              thumbIcon: thumbIcon,
              value: isOn,
              onChanged: (bool value) {
                setState(() {
                  widget.onToggle();
                  isOn = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
