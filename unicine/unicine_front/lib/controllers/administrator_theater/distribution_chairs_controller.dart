import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:uni_cine/models/administrator_theater/distribution_chairs.dart';
import 'package:uni_cine/repositories/api/unicine_api.dart';
import 'package:uni_cine/utils/util.dart';
import 'package:uni_cine/widgets/dialogs.dart';

class DistributionChairsController extends SimpleNotifier {
  final GlobalKey<FormState> formDistributionKey = GlobalKey<FormState>();

  List<DistributionChairs> listDistributionChairs = [];
  DistributionChairs? editDistributionChairs;
  bool loading = true;
  bool isEdit = false;

  // Inputs
  int idDistributionChairs = 0;
  String nombreDistribucion = '';
  int totalSillas = 0;
  int filas = 0;
  int columnas = 0;

  bool validateForm(formConfectioneryKey) {
    if (formConfectioneryKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void editSelectDistributionChairs(DistributionChairs distributionChairs) {
    editDistributionChairs = distributionChairs;
    notify();
    Timer(const Duration(milliseconds: 200),
        () => formDistributionKey.currentState?.reset());
  }

  void _cleanInputs() {
    if (loading == false) {
      editDistributionChairs = null;
      notify();
      Timer(const Duration(milliseconds: 200),
          () => formDistributionKey.currentState?.reset());
    }
  }

  void isUpdateDistributionChairs() {
    isEdit = !isEdit;
    notify();
  }

  void getDistributionChairs() async {
    var res = await UnicineApi.httpGet('/lista-distribucion-sillas');

    for (final i in res['listaDistribucionSillas']) {
      listDistributionChairs.add(DistributionChairs.fromMap(i));
      listDistributionChairs.toList();
    }
    loading = false;
    notify();
  }

  Future<void> newDistributionChairs(BuildContext context) async {
    DistributionChairs distributionChairs = DistributionChairs(
      idDistribucionSilla: idDistributionChairs,
      distribucionSillas: nombreDistribucion,
      totalSillas: totalSillas,
      filas: filas,
      columnas: columnas,
    );

    try {
      await UnicineApi.post(
              '/crear-distribucion-sillas', distributionChairs.toJson())
          .then((json) {
        final newDistributionChairs =
            DistributionChairs.fromMap(json['distribucionSillas']);
        listDistributionChairs.add(newDistributionChairs);
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
      log(runtimeType,
          'Error en newDistributionChairs DistributionChairsController $e');
    }
  }

  Future<void> updateDistributionChairs(BuildContext context) async {
    try {
      if (editDistributionChairs == null &&
          editDistributionChairs!.idDistribucionSilla == null) {
        return;
      }
      isUpdateDistributionChairs();
      for (int i = 0; i < listDistributionChairs.length; i++) {
        if (listDistributionChairs[i].idDistribucionSilla ==
            editDistributionChairs!.idDistribucionSilla) {
          editDistributionChairs = DistributionChairs(
            idDistribucionSilla: editDistributionChairs?.idDistribucionSilla,
            distribucionSillas: nombreDistribucion == ''
                ? editDistributionChairs?.distribucionSillas
                : nombreDistribucion,
            totalSillas: totalSillas == 0
                ? editDistributionChairs?.totalSillas
                : totalSillas,
            filas: filas == 0 ? editDistributionChairs?.filas : filas,
            columnas:
                columnas == 0 ? editDistributionChairs?.columnas : columnas,
          );
          listDistributionChairs[i] = editDistributionChairs!;
        }
      }

      await UnicineApi.put('/actualizar-distribucion-sillas',
              editDistributionChairs!.toJson())
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
      log(runtimeType,
          'Error en updateDistributionChairs DistributionChairsController $e');
    }
  }

  Future<void> deleteDistributionChairs(BuildContext context, int id) async {
    try {
      await UnicineApi.delete('/eliminar-distribucion-sillas/$id', {})
          .then((json) {
        listDistributionChairs.removeWhere((distributionChairs) =>
            distributionChairs.idDistribucionSilla == id);
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
      log(runtimeType,
          'Error en deleteDistributionChairs DistributionChairsController $e');
    }
  }
}
