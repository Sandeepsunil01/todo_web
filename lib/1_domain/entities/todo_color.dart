import 'package:flutter/material.dart';

class TodoColor {
  final int colorIndex;

  TodoColor({required this.colorIndex});

  static const List<Color> predefinedColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  Color get color => predefinedColors[colorIndex];
}
