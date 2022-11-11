import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/controllers/login/auth_controller.dart';
import 'package:uni_cine/main.dart';

import 'package:uni_cine/router/router.dart';
import 'package:uni_cine/ui/shared/inputs/custom_inputs.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/shared/link_text.dart';

final loginFormProvider = SimpleProvider(
  (ref) => AuthController(),
);

class LoginView extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      final ctrl = ref.watch(loginFormProvider);

      return SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 60),
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 450),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: const Color.fromARGB(255, 201, 201, 201),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Inicia sesión con tu correo electrónico',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            '¿No tienes una cuenta?',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                          LinkText(
                            text: 'Regístrate',
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, Flurorouter.registerRoute);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      // Email
                      TextFormField(
                        onFieldSubmitted: (value) =>
                            onFormSubmit(ctrl, context),
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? '')) {
                            return 'Email no válido';
                          }
                          return null;
                        },
                        onChanged: (value) => ctrl.email = value,
                        decoration: CustomInputs.loginInputDecoration(
                          hint: 'Ingrese su correo',
                          label: 'Email',
                          icon: Icons.email_outlined,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Password
                      TextFormField(
                        onFieldSubmitted: (value) =>
                            onFormSubmit(ctrl, context),
                        onChanged: (value) => ctrl.password = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su contraseña';
                          }

                          if (value.length < 2) {
                            return 'La contraseña debe tener más de 6 caracteres';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: CustomInputs.loginInputDecoration(
                          hint: '**********',
                          label: 'Contraseña',
                          icon: Icons.lock_outline_rounded,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: LinkText(
                          text: '¿Olvidaste tu contraseña?',
                          onPressed: () {
                            // TODO: Ir a registro
                          },
                        ),
                      ),
                      const SizedBox(height: 25),
                      CustomOutlinedButton(
                        onPressed: () {
                          onFormSubmit(ctrl, context);
                        },
                        text: 'Iniciar Sesión',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  void onFormSubmit(AuthController ctrl, BuildContext context) {
    final isValid = ctrl.validateForm(formKey);
    if (isValid) authProvider.read.login(ctrl.email, ctrl.password, context);
  }
}
