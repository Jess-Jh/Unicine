import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

import 'package:uni_cine/router/router.dart';
import 'package:uni_cine/controllers/login/auth_controller.dart';

import 'package:uni_cine/ui/shared/inputs/custom_inputs.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/shared/link_text.dart';

final registerFormProvider = SimpleProvider(
  (ref) => AuthController(),
);

class RegisterView extends ConsumerWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RegisterView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(registerFormProvider);

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
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
                      'Inscríbete con tu correo',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          '¿Ya tienes una cuenta?',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                        LinkText(
                          text: 'Inicia sesión',
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              Flurorouter.loginRoute,
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    // Imagen Url
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese la url de la imagen de perfil';
                        }
                        return null;
                      },
                      onChanged: (value) => ctrl.urlImagen = value,
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Url imagen de perfil',
                        label: 'Image',
                        icon: Icons.person_pin,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese su cédula';
                        }
                        if (value.length < 10) {
                          return 'La cédula debe tener más de 9 caracteres';
                        }
                        return null;
                      },
                      onChanged: (value) => ctrl.cedula = value,
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su cédula',
                        label: 'Cédula',
                        icon: Icons.credit_card_outlined,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese su nombre';
                        }
                        if (value.length < 3) {
                          return 'Su nombre debe tener más de 3 caracteres';
                        }
                        return null;
                      },
                      onChanged: (value) => ctrl.nombre = value,
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su nombre completo',
                        label: 'Nombre',
                        icon: Icons.person,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese su número de teléfono';
                        }
                        if (value.length < 6) {
                          return 'El número de teléfono debe tener más de 6 caracteres';
                        }
                        return null;
                      },
                      onChanged: (value) => ctrl.telefono = value,
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su número de teléfono(s)',
                        label: 'Teléfono(s)',
                        icon: Icons.format_list_numbered_rounded,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (value) {
                        if (!EmailValidator.validate(value ?? '')) {
                          return 'Email no válido';
                        }
                        return null;
                      },
                      onChanged: (value) => ctrl.email = value,
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su correo electrónico',
                        label: 'Email',
                        icon: Icons.email_outlined,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Contraseña
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese su contraseña';
                        }
                        if (value.length < 6) {
                          return 'La contraseña debe tener más de 6 caracteres';
                        }
                        return null;
                      },
                      onChanged: (value) => ctrl.password = value,
                      obscureText: true,
                      decoration: CustomInputs.loginInputDecoration(
                        hint: '**********',
                        label: 'Contraseña',
                        icon: Icons.lock_outline_rounded,
                      ),
                    ),
                    const SizedBox(height: 25),
                    CustomOutlinedButton(
                      onPressed: () {
                        final validForm = ctrl.validateForm(formKey);
                        if (!validForm) return;
                        ctrl.register(context);
                      },
                      text: 'Crear Cuenta',
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
