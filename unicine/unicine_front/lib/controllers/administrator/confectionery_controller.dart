import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:uni_cine/models/administrator/confectionery.dart';
import 'package:uni_cine/repositories/api/unicine_api.dart';
import 'package:uni_cine/utils/util.dart';
import 'package:uni_cine/widgets/dialogs.dart';

class ConfectioneryController extends SimpleNotifier {
  final GlobalKey<FormState> formConfectioneryKey = GlobalKey<FormState>();
  List<Confectionery> confectioneries = [];
  Confectionery? editConfectionery;
  bool loading = true;
  bool isEdit = false;

  // Inputs
  int idConfectionery = 0;
  String urlImagen = '';
  String precio = '0';
  String nombre = '';

  // Dates functions
  int cantBuyConfectionery = 0;
  double priceTotalBuy = 0;

  bool validateForm(formConfectioneryKey) {
    if (formConfectioneryKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void editSelectConfectionery(Confectionery confectionery) {
    editConfectionery = confectionery;
    notify();
    Timer(const Duration(milliseconds: 200),
        () => formConfectioneryKey.currentState?.reset());
  }

  void _cleanInputs() {
    if (loading == false) {
      editConfectionery = null;
      notify();
      Timer(const Duration(milliseconds: 200),
          () => formConfectioneryKey.currentState?.reset());
    }
  }

  void isUpdateConfectionery() {
    isEdit = !isEdit;
    notify();
  }

  void getConfectioneries() async {
    var res = await UnicineApi.httpGet('/lista-confiteria');

    for (final i in res['confiterias']) {
      confectioneries.add(Confectionery.fromMap(i));
      confectioneries.toList();
    }
    loading = false;
    notify();
  }

  Future<void> newConfectionery(BuildContext context) async {
    Confectionery confectionery = Confectionery(
      idConfiteria: idConfectionery,
      nombre: nombre,
      precio: double.parse(precio),
      imagen: urlImagen,
    );

    try {
      await UnicineApi.post('/crear-confiteria', confectionery.toJson())
          .then((json) {
        final newConfectionery = Confectionery.fromMap(json['confiteria']);
        confectioneries.add(newConfectionery);
        loading = false;
        Dialogs.showSnackbarTop(
          context,
          json['mensaje'],
          isError: false,
        );
        _cleanInputs();
        notify();
        return;
      }).catchError((e) => throw e);
    } catch (e) {
      Dialogs.showSnackbarTop(
        context,
        e.toString(),
        isError: true,
      );
      log(runtimeType, 'Error en newConfectionery ConfectioneryController $e');
    }
  }

  Future<void> updateConfectionery(BuildContext context) async {
    try {
      if (editConfectionery == null &&
          editConfectionery!.idConfiteria == null) {
        return;
      }
      isUpdateConfectionery();
      for (int i = 0; i < confectioneries.length; i++) {
        if (confectioneries[i].idConfiteria ==
            editConfectionery!.idConfiteria) {
          editConfectionery = Confectionery(
            idConfiteria: editConfectionery?.idConfiteria,
            nombre: nombre == '' ? editConfectionery?.nombre : nombre,
            precio: double.parse(precio) == 0
                ? editConfectionery?.precio
                : double.parse(precio),
            imagen: urlImagen == '' ? editConfectionery?.imagen : urlImagen,
          );
          confectioneries[i] = editConfectionery!;
        }
      }

      await UnicineApi.put(
              '/actualizar-confiteria', editConfectionery!.toJson())
          .then((json) {
        loading = false;
        Dialogs.showSnackbarTop(
          context,
          json['mensaje'],
          isError: false,
        );

        _cleanInputs();
        notify();
      }).catchError((e) => throw e);
    } catch (e) {
      Dialogs.showSnackbarTop(
        context,
        e.toString(),
        isError: true,
      );
      log(runtimeType, 'Error en newConfectionery ConfectioneryController $e');
    }
  }

  Future<void> deleteConfectionery(BuildContext context, int id) async {
    try {
      await UnicineApi.delete('/eliminar-confiteria/$id', {}).then((json) {
        confectioneries
            .removeWhere((confectionery) => confectionery.idConfiteria == id);
        loading = false;
        Dialogs.showSnackbarTop(
          context,
          json['mensaje'],
          isError: false,
        );

        _cleanInputs();
        notify();
      }).catchError((e) => throw e);
    } catch (e) {
      Dialogs.showSnackbarTop(
        context,
        e.toString(),
        isError: true,
      );
      log(runtimeType, 'Error en newConfectionery ConfectioneryController $e');
    }
  }

  void getMoreBuy(int i) {
    cantBuyConfectionery++;
    confectioneries[i].cant = (confectioneries[i].cant ?? 0) + 1;
    priceTotalBuy = priceTotalBuy + (confectioneries[i].precio ?? 0);

    notify();
  }

  void getLessBuy(int i) {
    cantBuyConfectionery--;
    confectioneries[i].cant = (confectioneries[i].cant ?? 0) - 1;
    priceTotalBuy = priceTotalBuy - (confectioneries[i].precio ?? 0);
    notify();
  }
}
