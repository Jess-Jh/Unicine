import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

import 'package:uni_cine/router/router.dart';
import 'package:uni_cine/controllers/auth_controller.dart';

import 'package:uni_cine/services/local_storage.dart';
import 'package:uni_cine/services/navigation_service.dart';

import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/ui/layouts/unicine_layout_page.dart';
import 'package:uni_cine/ui/layouts/splash/splash_layout.dart';

final authProvider = SimpleProvider((ref) => AuthController());

void main() async {
  // setupLocator();
  await LocalStorage.configurePrefs();
  Flurorouter.configureRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      final ctrl = ref.watch(authProvider);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'UniCine',
        initialRoute: '/',
        onGenerateRoute: Flurorouter.router.generator,
        navigatorKey: NavigationService.navigatorKey,

        builder: (_, child) {
          if (ctrl.authStatus == AuthStatus.checking) {
            return const SplashLayout();
          }
          if (ctrl.authStatus == AuthStatus.authenticated) {
            return AdministratorLayoutPage(child: child!);
          } else {
            return UnicineLayoutPage(child: child!);
          }
        },
        // builder: (_, child) => const AuthLayout(),
      );
    });
  }
}
