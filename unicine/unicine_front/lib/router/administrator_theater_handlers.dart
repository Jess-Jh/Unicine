import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_meedu/ui.dart';

import 'package:uni_cine/main.dart';
import 'package:uni_cine/controllers/auth_controller.dart';
import 'package:uni_cine/router/router.dart';

import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/ui/views/administrator_theater/manage_function/manage_function_view.dart';
import 'package:uni_cine/ui/views/administrator_theater/manage_hours/manage_hours_view.dart';
import 'package:uni_cine/ui/views/administrator_theater/manage_room/manage_room_view.dart';

import 'package:uni_cine/ui/views/unicine/login_view.dart';

class AdministratorTheaterHandlers {

  static Handler manageRooms     = Handler(handlerFunc: ((context, parameters) => ValidateView(const ManageRoomView(), Flurorouter.roomRoute)));
  static Handler manageHours     = Handler(handlerFunc: ((context, parameters) => ValidateView(const ManageHoursView(), Flurorouter.hourRoute)));
  static Handler manageFunctions = Handler(handlerFunc: ((context, parameters) => ValidateView(const ManageFunctionView(), Flurorouter.functionRoute)));

}

class ValidateView extends ConsumerWidget {
  final Widget view;
  final String routeName;
  const ValidateView(this.view, this.routeName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {

    final ctrl = ref.watch(authProvider);
    sideMenuProvider.read.setCurrentPageUrl(routeName);

    if (ctrl.authStatus == AuthStatus.notAuthenticated) {
      return LoginView();
    } else {
      return view;
    }
  }
}