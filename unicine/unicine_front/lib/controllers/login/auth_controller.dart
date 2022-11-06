import 'package:flutter_meedu/meedu.dart';
import 'package:uni_cine/models/account/user.dart';
import 'package:uni_cine/models/client/client.dart';
import 'package:uni_cine/repositories/api/unicine_api.dart';
import 'package:uni_cine/router/router.dart';
import 'package:uni_cine/services/navigation_service.dart';
import 'package:uni_cine/services/notifications_service.dart';

enum AuthStatus {
  checking,
  authenticated,
  administratorAuthenticated,
  administratorTheaterAuthenticated,
  notAuthenticated,
}

class AuthController extends SimpleNotifier {
  Client? client;
  User user = User();
  AuthStatus authStatus = AuthStatus.checking;

  AuthController() {
    isAuthenticated(user);
  }

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

  login(String email, String password) {
    final data = {'email': email, 'password': password};

    UnicineApi.httpGet('/auth/login/$email/$password').then((json) {
      final user = User.fromJson(json);
      isAuthenticated(user);
      notify();
    }).catchError((e) {
      print('Error en $e');
      NotificationsService.showSnackbarError(e);
    });
  }

  Future<bool> isAuthenticated(User user) async {
    if (user.id == null) {
      authStatus = AuthStatus.notAuthenticated;
      NavigationService.replaceTo(Flurorouter.loginRoute);
      notify();
      return false;
    }
    if (user.id == 1) {
      authStatus = AuthStatus.authenticated;
      NavigationService.replaceTo(Flurorouter.billboardRoute);
      notify();
      return true;
    }
    if (user.id == 2) {
      authStatus = AuthStatus.administratorAuthenticated;
      NavigationService.replaceTo(Flurorouter.administratorRoute);
      notify();
      return true;
    }
    if (user.id == 3) {
      authStatus = AuthStatus.administratorTheaterAuthenticated;
      NavigationService.replaceTo(Flurorouter.administratorTheaterRoute);
      notify();
      return true;
    }
    await Future.delayed(const Duration(milliseconds: 2000));
    return true;
  }

  register() {
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
      NavigationService.replaceTo(Flurorouter.billboardRoute);

      notify();
    }).catchError((e) {
      print('Error en $e');
      NotificationsService.showSnackbarError(e);
    });
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

