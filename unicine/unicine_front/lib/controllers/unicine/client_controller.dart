import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:uni_cine/main.dart';
import 'package:uni_cine/models/client/client.dart';
import 'package:uni_cine/models/unicine/pqrs.dart';
import 'package:uni_cine/models/unicine/purchase.dart';
import 'package:uni_cine/repositories/api/unicine_api.dart';
import 'package:uni_cine/utils/util.dart';
import 'package:uni_cine/widgets/dialogs.dart';

class ClientController extends SimpleNotifier {
  final GlobalKey<FormState> formMembershipKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formPQRSKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formUserKey = GlobalKey<FormState>();

  List<Client> listClients = [];
  List<Purchase> listPurchase = [];
  // inputs
  Client? cliente;
  String mensajePQRS = '';
  String email = '';
  String password = '';

  // Inputs edit Client
  String cedula = '';
  String nombre = '';
  String telefono = '';

  Client? editClient;

  bool loading = true;

  bool validateForm(formMembershipKey) {
    if (formMembershipKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  bool validateFormPQRS(formPQRSKey) {
    if (formPQRSKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  bool validateUserForm(formUserKey) {
    if (formUserKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void registerBuyMembreship(BuildContext context) async {
    await UnicineApi.httpGet('/validar-membresia/$email/$password')
        .then((json) {
      Dialogs.showSnackbarTop(
        context,
        json['mensaje'],
        isError: false,
        backgroundColor: Colors.white,
      );
      notify();
    });
  }

  void getClients() async {
    var res = await UnicineApi.httpGet('/detalle-usuarios');

    for (final i in res['clientes']) {
      listClients.add(Client.fromMap(i));
      listClients.toList();
    }
    loading = false;
    notify();
  }

  void getPurchaseClient() async {
    var res = await UnicineApi.httpGet(
        '/historial-compras/${authProvider.read.clientLogin?.email}');

    for (final i in res) {
      listPurchase.add(Purchase.fromMap(i));
      listPurchase.toList();
    }
    loading = false;
    notify();
  }

  void registerPQRS(BuildContext context) async {
    final pqrs = Pqrs(
      idPqrs: 0,
      mensaje: mensajePQRS,
      cliente: authProvider.read.clientLogin,
    );

    try {
      await UnicineApi.post('/registrar-PQRS', pqrs.toJson()).then((json) {
        // final newPQRS = Pqrs.fromMap(json['pqrs']);
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
      log(runtimeType, 'Error en newPQRS ClientController $e');
    }
  }

  void _cleanInputs() {
    if (loading == false) {
      cliente = null;
      mensajePQRS = '';
      notify();
      Timer(const Duration(milliseconds: 200),
          () => formPQRSKey.currentState?.reset());
    }
  }

  Future<void> updateClient(BuildContext context) async {
    try {
      if (editClient == null && editClient!.cedula == null) return;

      for (int i = 0; i < listClients.length; i++) {
        if (listClients[i].id == editClient!.id) {
          editClient = Client(
            id: editClient?.id,
            nombreCompleto: nombre == '' ? editClient?.nombreCompleto : nombre,
            email: email == '' ? editClient?.email : email,
            contrasena: password == '' ? editClient?.contrasena : password,
          );
          listClients[i] = editClient!;
        }
      }

      await UnicineApi.put('/update', editClient!.toJson()).then((json) {
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
      log(runtimeType, 'Error en editClient ClientController $e');
    }
  }
}
