import 'package:flutter/material.dart';

class Chair {
  int? column;
  String? row;
  Color? color;
  IconData? icon;
  dynamic status;

  Chair({
    this.column,
    this.icon,
    this.row,
    this.color = Colors.black,
    this.status,
  });
}
