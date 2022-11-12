import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/controllers/login/auth_controller.dart';
import 'package:uni_cine/controllers/sidemenu_controller.dart';
import 'package:uni_cine/repositories/api/unicine_api.dart';

import 'package:uni_cine/router/router.dart';

import 'package:uni_cine/services/local_storage.dart';
import 'package:uni_cine/services/navigation_service.dart';
import 'package:uni_cine/services/notifications_service.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';

import 'package:uni_cine/ui/layouts/administrator_theater_layout.dart';
import 'package:uni_cine/ui/layouts/unicine_layout_page.dart';
import 'package:uni_cine/ui/layouts/splash/splash_layout.dart';

final authProvider = SimpleProvider((ref) => AuthController());
final sideMenuProvider = SimpleProvider((ref) => SideMenuController());

void main() async {
  // setupLocator();
  await LocalStorage.configurePrefs();
  UnicineApi.configureDio();
  Flurorouter.configureRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      final ctrl = ref.watch(authProvider);
      return MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'UniCine',
        initialRoute: Flurorouter.rootRoute,
        onGenerateRoute: Flurorouter.router.generator,
        navigatorKey: NavigationService.navigatorKey,
        scaffoldMessengerKey: NotificationsService.messengerKey,

        builder: (_, child) {
          if (ctrl.authStatus == AuthStatus.checking) {
            return const SplashLayout();
          }
          if (ctrl.authStatus == AuthStatus.authenticated) {
            return UnicineLayoutPage(child: child!);
          }
          if (ctrl.authStatus == AuthStatus.administratorAuthenticated) {
            return AdministratorLayoutPage(child: child!);
          }
          if (ctrl.authStatus == AuthStatus.administratorTheaterAuthenticated) {
            return AdministratorTheaterLayout(child: child!);
          } else {
            return UnicineLayoutPage(child: child!);
          }
        },
        // builder: (_, child) => const AuthLayout(),
      );
    });
  }
}
