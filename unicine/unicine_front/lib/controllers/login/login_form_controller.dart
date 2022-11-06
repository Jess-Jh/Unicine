import 'package:flutter_meedu/meedu.dart';

class LoginFormController extends SimpleNotifier {
  String email = '';
  String password = '';

  LoginFormController();

  bool validateForm(formKey) {
    if (formKey.currentState!.validate()) {
      // print('Form valid... Login');
      // print('$email ==== $password');
      return true;
    } else {
      // print('Form not valid');
      return false;
    }
  }
}
