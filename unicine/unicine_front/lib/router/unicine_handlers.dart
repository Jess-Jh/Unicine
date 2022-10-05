import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import 'package:uni_cine/main.dart';
import 'package:uni_cine/controllers/auth_controller.dart';
import 'package:uni_cine/router/router.dart';

import 'package:uni_cine/ui/views/unicine/login_view.dart';
import 'package:uni_cine/ui/views/unicine/register_view.dart';
import 'package:uni_cine/ui/views/unicine/billboard/billboard_view.dart';
import 'package:uni_cine/ui/views/unicine/room_unicine/room_unicine_view.dart';

class UnicineHandlers {
  static Handler login       = Handler(handlerFunc: ((context, parameters) => ValidateView(view: LoginView(), view2: BillboardView(), routeName: Flurorouter.loginRoute )));
  static Handler register    = Handler(handlerFunc: ((context, parameters) => ValidateView(view: RegisterView(), view2: BillboardView(), routeName: Flurorouter.registerRoute )));
  static Handler billboard   = Handler(handlerFunc: ((context, parameters) => ValidateView(view2: BillboardView(), routeName: Flurorouter.billboardRoute )));
  static Handler roomUnicine = Handler(handlerFunc: ((context, parameters) => ValidateView(view2: const RoomUnicineView(), routeName: Flurorouter.roomUnicineRoute )));
}

class ValidateView extends ConsumerWidget {
  final Widget? view;
  final Widget view2;
  final String routeName;
  const ValidateView({Key? key, this.view, required this.view2, required this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {

    final ctrl = ref.watch(authProvider);
    sideMenuProvider.read.setCurrentPageUrl(routeName);

    if (ctrl.authStatus == AuthStatus.notAuthenticated) {
      return view ?? LoginView();
    } else {
      return view2;
    }
  }
}

