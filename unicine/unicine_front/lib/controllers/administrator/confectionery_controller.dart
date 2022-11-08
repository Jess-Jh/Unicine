import 'package:flutter_meedu/meedu.dart';

class ConfectioneryController extends SimpleNotifier {
  List<dynamic> confectioneries = [];
  bool loading = true;

  // Inputs
  int idTeatro = 0;
  String nombre = '';
  String direccion = '';
}
