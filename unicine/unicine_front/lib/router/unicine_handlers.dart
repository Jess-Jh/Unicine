import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import 'package:uni_cine/main.dart';
import 'package:uni_cine/controllers/auth_controller.dart';

import 'package:uni_cine/ui/views/unicine/login_view.dart';
import 'package:uni_cine/ui/views/unicine/register_view.dart';
import 'package:uni_cine/ui/views/administrator/manage_theater_view.dart';

class UnicineHandlers {
  static Handler login = Handler(handlerFunc: ((context, parameters) => ValidateView(LoginView())));
  static Handler register = Handler(handlerFunc: ((context, parameters) => ValidateView(RegisterView())));
}

class ValidateView extends ConsumerWidget {
  final Widget view;
  const ValidateView(this.view, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(authProvider);
    if (ctrl.authStatus == AuthStatus.notAuthenticated) {
      return view;
    } else {
      return const ManageTheaterView();
    }
  }
}

