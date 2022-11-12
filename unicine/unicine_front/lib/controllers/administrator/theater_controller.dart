import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:uni_cine/models/administrator/theater.dart';
import 'package:uni_cine/repositories/api/unicine_api.dart';

class TheaterController extends SimpleNotifier {
  final GlobalKey<FormState> formTheaterKey = GlobalKey<FormState>();
  List<Theater> theaters = [];
  Theater? editMovie;
  bool isUpdate = false;
  bool loading = true;

  // Inputs
  String nombre = '';
  String direccion = '';

  void getTheaters() async {
    var res = await UnicineApi.httpGet('/lista-teatros');

    for (final i in res['teatros']) {}
  }
}
