import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:uni_cine/models/account/auth_response.dart';
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
  AuthResponse? authResponse;
  AuthStatus authStatus = AuthStatus.checking;
  bool? buttonAuthenticated = false;
  bool loading = true;

  // inputs
  String urlImagen = '';
  String cedula = '';
  String nombre = '';
  String telefono = '';
  String email = '';
  String password = '';

  Client? clientLogin;

  bool validateForm(formKey) {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  AuthController() {
    isAuthenticated();
  }

  void login(String email, String password, BuildContext context) {
    UnicineApi.httpGet('/auth/login/$email/$password').then((json) {
      authResponse = AuthResponse.fromMap(json['login']);

      LocalStorage.prefs.setString('token', '${authResponse?.jwttoken}');
      LocalStorage.prefs.setString('rol', '${authResponse?.rol}');
      LocalStorage.prefs.setString('user', '${authResponse?.email}');
      UnicineApi.configureDio();
      isAuthenticated();

      Dialogs.showSnackbarTop(
        context,
        json['mensaje'],
        isError: false,
        backgroundColor: Colors.white,
      );

      saveUser();
      notify();
    }).catchError((e) {
      Dialogs.showSnackbarTop(
        context,
        e,
        isError: true,
      );
    });
  }

  void saveUser() async {
    String emailUser = LocalStorage.prefs.getString('user') ?? '';

    await UnicineApi.httpGet('/obtener-cliente-email/$emailUser').then((json) {
      clientLogin = Client.fromMap(json['cliente']);
    });

    loading = false;
    notify();
  }

  Future<bool> isAuthenticated() async {
    _token = LocalStorage.prefs.getString('token');
    String? rol = LocalStorage.prefs.getString('rol');

    if (_token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notify();
      return false;
    } else {
      if (rol == 'CLIENTE') {
        authStatus = AuthStatus.authenticated;
        NavigationService.replaceTo(Flurorouter.billboardRoute);
        buttonAuthenticated = true;
        notify();
        return true;
      }
      if (rol == 'ADMIN') {
        authStatus = AuthStatus.administratorAuthenticated;
        NavigationService.replaceTo(Flurorouter.administratorRoute);

        notify();
        return true;
      }
      if (rol == 'ADMIN_TEATRO') {
        authStatus = AuthStatus.administratorTheaterAuthenticated;
        NavigationService.replaceTo(Flurorouter.administratorTheaterRoute);
        notify();
        return true;
      }
    }

    await Future.delayed(const Duration(milliseconds: 2000));
    return true;
  }

  void register(BuildContext context) {
    final client = Client(
      id: 1,
      label: "Cliente",
      cedula: cedula,
      imagenPerfil: urlImagen,
      nombreCompleto: nombre,
      email: email,
      contrasena: password,
      membresia: false,
      estado: false,
    );

    UnicineApi.post('/auth/register', client).then((json) {
      final client = Client.fromJson(json);

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', '${client.contrasena}');
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
    LocalStorage.prefs.remove('rol');
    LocalStorage.prefs.remove('user');
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

