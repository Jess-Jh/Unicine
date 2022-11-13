import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:uni_cine/models/account/user.dart';
import 'package:uni_cine/models/client/client.dart';
import 'package:uni_cine/repositories/api/unicine_api.dart';
import 'package:uni_cine/router/router.dart';
import 'package:uni_cine/services/local_storage.dart';
import 'package:uni_cine/services/navigation_service.dart';
import 'package:uni_cine/widgets/dialogs.dart';

enum AuthStatus {
  checking,
  authenticated,
  administratorAuthenticated,
  administratorTheaterAuthenticated,
  notAuthenticated,
}

class AuthController extends SimpleNotifier {
  String? _token;
  Client? client;
  User? user = User(
      id: 3,
      label: 'Administrador',
      idUser: '2321',
      email: 'admin98@gmail.com',
      password: '345353');
  AuthStatus authStatus = AuthStatus.checking;
  bool? buttonAuthenticated = false;

  // inputs
  String urlImagen = '';
  String cedula = '';
  String nombre = '';
  String telefono = '';
  String email = '';
  String password = '';

  bool validateForm(formKey) {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  AuthController() {
    User userAuth;
    if (user == null) {
      authStatus = AuthStatus.notAuthenticated;
    } else {
      userAuth = user!;
      isAuthenticated(userAuth);
    }
  }

  login(String email, String password, BuildContext context) {
    UnicineApi.httpGet('/auth/login/$email/$password').then((json) {
      final user = User.fromJson(json);
      if (user == null) {
        this.user;
        isAuthenticated(this.user!);
      }
      Dialogs.showSnackbarTop(
        context,
        'Ha iniciado sesión con éxito',
        isError: false,
        backgroundColor: Colors.white,
      );
      notify();
    }).catchError((e) {
      Dialogs.showSnackbarTop(
        context,
        'Error en $e',
        isError: true,
      );
    });
  }

  Future<bool> isAuthenticated(User user) async {
    final token = LocalStorage.prefs.getString('token');

    if (user.id == 1) {
      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', '${user.email}+${user.password}');
      NavigationService.replaceTo(Flurorouter.billboardRoute);

      UnicineApi.configureDio();
      buttonAuthenticated = true;
      notify();
      return true;
    }
    if (user.id == 2) {
      authStatus = AuthStatus.administratorAuthenticated;
      LocalStorage.prefs.setString('token', '${user.email}+${user.password}');
      NavigationService.replaceTo(Flurorouter.administratorRoute);
      UnicineApi.configureDio();
      notify();
      return true;
    }
    if (user.id == 3) {
      authStatus = AuthStatus.administratorTheaterAuthenticated;
      LocalStorage.prefs.setString('token', '${user.email}+${user.password}');
      NavigationService.replaceTo(Flurorouter.administratorTheaterRoute);
      UnicineApi.configureDio();
      notify();
      return true;
    }

    await Future.delayed(const Duration(milliseconds: 2000));
    return true;
  }

  register(BuildContext context) {
    final client = Client(
      id: 1,
      label: "Cliente",
      idUser: cedula,
      profilePicture: urlImagen,
      fullName: nombre,
      email: email,
      password: password,
      membership: false,
      status: false,
    );

    UnicineApi.post('/auth/register', client).then((json) {
      final client = Client.fromJson(json);

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs
          .setString('token', '${client.email}+${client.password}');
      NavigationService.replaceTo(Flurorouter.billboardRoute);
      UnicineApi.configureDio();

      Dialogs.showSnackbarTop(
        context,
        'El cliente ha quedado registrado con éxito',
        isError: false,
      );

      notify();
    }).catchError((e) {
      Dialogs.showSnackbarTop(
        context,
        'Error en $e',
        isError: true,
      );
    });
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notify();
  }
}


  // Future<void> _saveClient(
  //     BuildContext context, void Function(Client client)? onSuccess) async {
  //   final client = Client(
  //     id: 1,
  //     label: "Cliente",
  //     idUser: cedula,
  //     profilePicture: urlImagen,
  //     fullName: nombre,
  //     email: email,
  //     membership: false,
  //     status: false,
  //   );

  //   try {
  //     Dialogs.showLoadingDialog(context, true);
  //     await registerRepository
  //         .registerClient(client: client)
  //         .then((value) async {
  //       Dialogs.showLoadingDialog(context, false);
  //       await Future.delayed(const Duration(milliseconds: 1000)).then((_) {
  //         Dialogs.showSnackbarTop(
  //           context,
  //           'El cliente ha quedado registrado con éxito',
  //           isError: false,
  //         );
  //         onSuccess?.call(value);
  //       });
  //     }).catchError((error) {
  //       Dialogs.showLoadingDialog(context, false);
  //       throw error;
  //     });
  //   } on FetchDataException {
  //     Dialogs.showSnackbarTop(context, 'Error de conexión');
  //   } on ValidationException catch (e) {
  //     log(runtimeType, e.message);
  //   } catch (e) {
  //     log(runtimeType, 'add Client: $e');
  //     Dialogs.showSnackbarTop(context, 'Error desconocido');
  //   }
  // }

