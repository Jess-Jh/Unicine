import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:uni_cine/models/administrator_theater/room.dart';
import 'package:uni_cine/repositories/api/unicine_api.dart';
import 'package:uni_cine/utils/util.dart';
import 'package:uni_cine/widgets/dialogs.dart';

class RoomManageController extends SimpleNotifier {
  final GlobalKey<FormState> formManageRoomKey = GlobalKey<FormState>();
  List<Room> rooms = [];
  Room? editRoom;
  bool loading = true;
  bool isEdit = false;
  bool changeDistributionChairs = false;
  PageController formPageController = PageController();
  int valuePage = 0;

  // Inputs
  int idRoom = 0;
  String nombre = '';
  String distribucionSillas = '';
  int? idDistribucionSillas;

  bool validateForm(formManageRoomKey) {
    if (formManageRoomKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void editSelectRoom(Room room) {
    editRoom = room;
    notify();
    Timer(const Duration(milliseconds: 200),
        () => formManageRoomKey.currentState?.reset());
  }

  void _cleanInputs() {
    if (loading == false) {
      editRoom = null;
      notify();
      Timer(const Duration(milliseconds: 200),
          () => formManageRoomKey.currentState?.reset());
    }
  }

  void isUpdateRoom() {
    isEdit = !isEdit;
    notify();
  }

  void getRooms() async {
    var res = await UnicineApi.httpGet('/lista-salas');

    for (final i in res['salas']) {
      rooms.add(Room.fromMap(i));
      rooms.toList();
    }
    loading = false;
    notify();
  }

  Future<void> newRoom(BuildContext context) async {
    Room room = Room(
      idSala: idRoom,
      nombre: nombre,
    );

    try {
      await UnicineApi.post('/crear-sala', room.toJson()).then((json) {
        final newRoom = Room.fromMap(json['sala']);
        rooms.add(newRoom);
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
      log(runtimeType, 'Error en newRoom RoomController $e');
    }
  }

  Future<void> updateRoom(BuildContext context) async {
    try {
      if (editRoom == null && editRoom!.idSala == null) {
        return;
      }
      isUpdateRoom();
      for (int i = 0; i < rooms.length; i++) {
        if (rooms[i].idSala == editRoom!.idSala) {
          editRoom = Room(
            idSala: editRoom?.idSala,
            nombre: nombre == '' ? editRoom?.nombre : nombre,
          );
          rooms[i] = editRoom!;
        }
      }

      await UnicineApi.put('/actualizar-sala', editRoom!.toJson()).then((json) {
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
      log(runtimeType, 'Error en updateRoom RoomManageController $e');
    }
  }

  Future<void> deleteRoom(BuildContext context, int id) async {
    try {
      await UnicineApi.delete('/eliminar-sala/$id', {}).then((json) {
        rooms.removeWhere((room) => room.idSala == id);
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
      log(runtimeType, 'Error en deleteRoom RoomController $e');
    }
  }

  void onChangeDistributionChairs(String chairs) {
    distribucionSillas = chairs;
    changeDistributionChairs = true;
    notify();

    Timer(const Duration(milliseconds: 200),
        () => formManageRoomKey.currentState?.reset());
  }

  void nextPageTypeRoom() {
    formPageController.nextPage(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
    valuePage++;
    notify();
  }

  void previusPageTypeRoom() {
    formPageController.previousPage(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
    valuePage--;
    notify();
  }
}
