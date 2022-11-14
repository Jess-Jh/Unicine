import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:uni_cine/models/administrator_theater/hour.dart';
import 'package:uni_cine/repositories/api/unicine_api.dart';
import 'package:uni_cine/utils/util.dart';
import 'package:uni_cine/widgets/dialogs.dart';

class HoursController extends SimpleNotifier {
  final GlobalKey<FormState> formHourKey = GlobalKey<FormState>();
  List<Hour> hours = [];
  Hour? editHour;
  bool loading = true;
  bool isEdit = false;
  bool changeDate = false;
  bool changeTime = false;

  // Inputs
  int idHour = 0;
  DateTime? fecha;
  String hora = '';

  bool validateForm(formHourKey) {
    if (formHourKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void editSelectHour(Hour hour) {
    editHour = hour;
    notify();
    Timer(const Duration(milliseconds: 200),
        () => formHourKey.currentState?.reset());
  }

  void _cleanInputs() {
    if (loading == false) {
      editHour = null;

      notify();
      Timer(const Duration(milliseconds: 200),
          () => formHourKey.currentState?.reset());
    }
  }

  void isUpdateHour() {
    isEdit = !isEdit;
    notify();
  }

  void getHours() async {
    var res = await UnicineApi.httpGet('/lista-horarios');

    for (final i in res['horarios']) {
      hours.add(Hour.fromMap(i));
      hours.toList();
    }
    loading = false;
    notify();
  }

  Future<void> newHour(BuildContext context) async {
    Hour hour = Hour(
      idHorario: 0,
      fecha: fecha,
      hora: hora,
    );

    try {
      await UnicineApi.post('/crear-horario', hour.toJson()).then((json) {
        final newHour = Hour.fromMap(json['horario']);
        print(json);
        hours.add(newHour);
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
      log(runtimeType, 'Error en newHour HourController $e');
    }
  }

  Future<void> updateHour(BuildContext context) async {
    try {
      if (editHour == null && editHour!.idHorario == null) {
        return;
      }
      isUpdateHour();
      for (int i = 0; i < hours.length; i++) {
        if (hours[i].idHorario == editHour!.idHorario) {
          editHour = Hour(
            idHorario: editHour?.idHorario,
            fecha: fecha ?? editHour?.fecha,
            hora: hora == '' ? editHour?.hora : hora,
          );
          hours[i] = editHour!;
        }
      }

      await UnicineApi.put('/actualizar-horario', editHour!.toJson())
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
      log(runtimeType, 'Error en updateHour HourController $e');
    }
  }

  Future<void> deleteHour(BuildContext context, int id) async {
    try {
      await UnicineApi.delete('/eliminar-horario/$id', {}).then((json) {
        hours.removeWhere((hour) => hour.idHorario == id);
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
      log(runtimeType, 'Error en deleteHour HourController $e');
    }
  }

  void onChangeDate(DateTime date) {
    fecha = date;
    changeDate = true;
    notify();

    Timer(const Duration(milliseconds: 200),
        () => formHourKey.currentState?.reset());
  }

  void onChangeTime(TimeOfDay time) {
    String hour =
        time.hour.toString().length == 1 ? '${0}${time.hour}' : '${time.hour}';
    String minutes = time.minute.toString().length == 1
        ? '${0}${time.minute}'
        : '${time.minute}';

    hora = '$hour:$minutes';
    changeTime = true;
    notify();

    Timer(const Duration(milliseconds: 200),
        () => formHourKey.currentState?.reset());
  }
}
