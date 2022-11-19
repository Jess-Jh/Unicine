import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:uni_cine/repositories/api/unicine_api.dart';
import 'package:uni_cine/widgets/dialogs.dart';

class ClientController extends SimpleNotifier {
  final GlobalKey<FormState> formMembershipKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool validateForm(formMembershipKey) {
    if (formMembershipKey.currentState!.validate()) {
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
}
