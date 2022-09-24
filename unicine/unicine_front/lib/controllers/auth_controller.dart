import 'package:flutter_meedu/meedu.dart';
import 'package:uni_cine/router/router.dart';
import 'package:uni_cine/services/local_storage.dart';
import 'package:uni_cine/services/navigation_service.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
}

class AuthController extends SimpleNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthController() {
    isAuthenticated();
  }

  login(String email, String password) {
    //TODO: Peticion HTTP

    _token = 'sfjasdflaksjdfhlasjhdfkasjhfdl';
    LocalStorage.prefs.setString('token', _token!);

    authStatus = AuthStatus.authenticated;
    notify();

    NavigationService.replaceTo(Flurorouter.administratorRoute);
  }

  Future<bool> isAuthenticated() async {
    if (LocalStorage.prefs.getString('token') == null) {
      authStatus = AuthStatus.notAuthenticated;
      notify();
      return false;
    }

    //TODO: ir al backend y comprobar si el JWT es válido

    await Future.delayed(const Duration(milliseconds: 2000));
    authStatus = AuthStatus.authenticated;
    notify();
    return true;
  }
}
