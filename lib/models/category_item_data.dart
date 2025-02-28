import 'package:flutter/material.dart';

class CategoryItemData {
  const CategoryItemData(
      {required this.id,
      required this.name,
      this.color = const Color.fromARGB(183, 63, 10, 163)});

  final String name;
  final String id;
  final Color color;
}
