import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:uni_cine/models/administrator/movie.dart';
import 'package:uni_cine/models/administrator_theater/hour.dart';
import 'package:uni_cine/models/administrator_theater/room.dart';
import 'package:uni_cine/models/unicine/function_room.dart';
import 'package:uni_cine/repositories/api/unicine_api.dart';

class FunctionController extends SimpleNotifier {
  final GlobalKey<FormState> formFunctionKey = GlobalKey<FormState>();
  List<FunctionRoom> listFunctions = [];
  FunctionRoom? editFunctionRoom;
  bool loading = true;
  bool isEdit = false;

  // Inputs
  int idFunction = 0;
  Movie? movie;
  Room? room;
  Hour? date;

  bool validateForm(formFunctionKey) {
    if (formFunctionKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void editSelectFunction(FunctionRoom functionRoom) {
    editFunctionRoom = functionRoom;
    notify();
    Timer(const Duration(milliseconds: 200),
        () => formFunctionKey.currentState?.reset());
  }

  void _cleanInputs() {
    if (loading == false) {
      editFunctionRoom = null;
      notify();
      Timer(const Duration(milliseconds: 200),
          () => formFunctionKey.currentState?.reset());
    }
  }

  void isUpdateFunction() {
    isEdit = !isEdit;
    notify();
  }

  void getFunctionsRoom() async {
    var res = await UnicineApi.httpGet('/lista-funciones-sala');

    for (final i in res['funcionesSala']) {
      listFunctions.add(FunctionRoom.fromMap(i));
      listFunctions.toList();
    }
    loading = false;
    notify();
  }

  // Future<void> newFunctionRoom(BuildContext context) async {
  //   FunctionRoom functionRoom = FunctionRoom(
  //     idFuncionSala: idFunction,
  //     pelicula: movie,
  //     sala: room,
  //   );

  //   try {
  //     await UnicineApi.post('/crear-confiteria', confectionery.toJson())
  //         .then((json) {
  //       final newConfectionery = Confectionery.fromMap(json['confiteria']);
  //       confectioneries.add(newConfectionery);
  //       loading = false;
  //       Dialogs.showSnackbarTop(
  //         context,
  //         json['mensaje'],
  //         isError: false,
  //       );
  //       _cleanInputs();
  //       notify();
  //       return;
  //     }).catchError((e) => throw e);
  //   } catch (e) {
  //     Dialogs.showSnackbarTop(
  //       context,
  //       e.toString(),
  //       isError: true,
  //     );
  //     log(runtimeType, 'Error en newConfectionery ConfectioneryController $e');
  //   }
  // }

  // Future<void> updateConfectionery(BuildContext context) async {
  //   try {
  //     if (editConfectionery == null &&
  //         editConfectionery!.idConfiteria == null) {
  //       return;
  //     }
  //     isUpdateConfectionery();
  //     for (int i = 0; i < confectioneries.length; i++) {
  //       if (confectioneries[i].idConfiteria ==
  //           editConfectionery!.idConfiteria) {
  //         editConfectionery = Confectionery(
  //           idConfiteria: editConfectionery?.idConfiteria,
  //           nombre: nombre == '' ? editConfectionery?.nombre : nombre,
  //           precio: double.parse(precio) == 0
  //               ? editConfectionery?.precio
  //               : double.parse(precio),
  //           imagen: urlImagen == '' ? editConfectionery?.imagen : urlImagen,
  //         );
  //         confectioneries[i] = editConfectionery!;
  //       }
  //     }

  //     await UnicineApi.put(
  //             '/actualizar-confiteria', editConfectionery!.toJson())
  //         .then((json) {
  //       loading = false;
  //       Dialogs.showSnackbarTop(
  //         context,
  //         json['mensaje'],
  //         isError: false,
  //       );

  //       _cleanInputs();
  //       notify();
  //     }).catchError((e) => throw e);
  //   } catch (e) {
  //     Dialogs.showSnackbarTop(
  //       context,
  //       e.toString(),
  //       isError: true,
  //     );
  //     log(runtimeType, 'Error en newConfectionery ConfectioneryController $e');
  //   }
  // }

  // Future<void> deleteConfectionery(BuildContext context, int id) async {
  //   try {
  //     await UnicineApi.delete('/eliminar-confiteria/$id', {}).then((json) {
  //       confectioneries
  //           .removeWhere((confectionery) => confectionery.idConfiteria == id);
  //       loading = false;
  //       Dialogs.showSnackbarTop(
  //         context,
  //         json['mensaje'],
  //         isError: false,
  //       );

  //       _cleanInputs();
  //       notify();
  //     }).catchError((e) => throw e);
  //   } catch (e) {
  //     Dialogs.showSnackbarTop(
  //       context,
  //       e.toString(),
  //       isError: true,
  //     );
  //     log(runtimeType, 'Error en newConfectionery ConfectioneryController $e');
  //   }
  // }
}
