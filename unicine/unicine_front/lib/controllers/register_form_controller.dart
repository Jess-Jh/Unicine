import 'package:flutter_meedu/meedu.dart';

class RegisterFormController extends SimpleNotifier {
  String urlImagen = '';
  String cedula = '';
  String nombre = '';
  String telefono = '';
  String email = '';
  String password = '';

  validateForm(formKey) {
    if (formKey.currentState!.validate()) {
      // print('$nombre, $urlImagen, $cedula, $nombre, $telefono');
      print('Form valid... Register');
      print('$email ==== $password');
    } else {
      print('Form not valid');
    }
  }
}
