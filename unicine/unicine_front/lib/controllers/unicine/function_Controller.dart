import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:uni_cine/utils/custom_colors.dart';

class FunctionController extends SimpleNotifier {
  Color? colorButtonDate;

  void changeColorDateFunction() {
    colorButtonDate = colorButtonDate == Colors.transparent
        ? CustomColors.principal.withOpacity(0.6)
        : Colors.transparent;

    notify();
  }
}
