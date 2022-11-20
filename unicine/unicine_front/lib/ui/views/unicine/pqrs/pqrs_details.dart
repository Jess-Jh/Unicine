import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/main.dart';
import 'package:uni_cine/ui/layouts/unicine_layout_page.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/shared/inputs/custom_form_input.dart';
import 'package:uni_cine/ui/shared/inputs/custom_inputs.dart';

class PQRSDetails extends StatelessWidget {
  const PQRSDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return (size.width >= 720)
        ? _TabletDesktopMenu(size: size)
        : _MobileMenu(size: size);
  }
}

class _TabletDesktopMenu extends ConsumerWidget {
  final Size size;
  const _TabletDesktopMenu({required this.size});

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(clientProvider);
    final ctrlClient = ref.watch(authProvider);

    return SizedBox(
      height: size.height / 2,
      width: size.width,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: ctrl.formPQRSKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Peticiones, quejas, reclamos y sugerencias',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CustomFormInput(
                  inputForm: TextFormField(
                    initialValue: ctrlClient.clientLogin?.nombreCompleto ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nombre cliente';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    style: const TextStyle(fontSize: 13),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Nombre cliente',
                      label: 'Nombre',
                      icon: Icons.people_alt_outlined,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                CustomFormInput(
                  inputForm: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ciudad';
                      }
                      return null;
                    },
                    style: const TextStyle(fontSize: 13),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Ciudad',
                      label: 'Ciudad',
                      icon: Icons.location_city_rounded,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CustomFormInput(
                  inputForm: TextFormField(
                    initialValue: ctrlClient.clientLogin?.email ?? '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese su correo electrónico';
                      }
                      return null;
                    },
                    style: const TextStyle(fontSize: 13),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Ingrese su correo electrónico',
                      label: 'Correo Electrónico',
                      icon: Icons.email_outlined,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                CustomFormInput(
                  inputForm: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese su número de teléfono';
                      }
                      return null;
                    },
                    style: const TextStyle(fontSize: 13),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Ingrese su número de teléfono',
                      label: 'Teléfono',
                      icon: Icons.phone_android_outlined,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: TextField(
                onChanged: (value) => ctrl.mensajePQRS = value,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: null,
                style: const TextStyle(fontSize: 13),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ingrese el mensaje que quiere enviar',
                  label: 'Mensaje',
                  icon: Icons.message_outlined,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: CustomOutlinedButton(
                fontSize: 18,
                width: size.width / 2,
                text: 'Enviar',
                onPressed: () {
                  if (!ctrl.validateForm(ctrl.formPQRSKey)) return;

                  ctrl.registerPQRS(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MobileMenu extends ConsumerWidget {
  final Size size;
  const _MobileMenu({required this.size});

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(clientProvider);
    final ctrlClient = ref.watch(authProvider);

    return SizedBox(
      height: size.height / 2,
      width: size.width,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: ctrl.formPQRSKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Peticiones, quejas, reclamos y sugerencias',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            CustomFormInput(
              inputForm: TextFormField(
                initialValue: ctrlClient.clientLogin?.nombreCompleto ?? '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nombre cliente';
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
                style: const TextStyle(fontSize: 13),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Nombre cliente',
                  label: 'Nombre',
                  icon: Icons.people_alt_outlined,
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomFormInput(
              inputForm: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ciudad';
                  }
                  return null;
                },
                style: const TextStyle(fontSize: 13),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ciudad',
                  label: 'Ciudad',
                  icon: Icons.location_city_rounded,
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomFormInput(
              inputForm: TextFormField(
                initialValue: ctrlClient.clientLogin?.email ?? '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su correo electrónico';
                  }
                  return null;
                },
                style: const TextStyle(fontSize: 13),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ingrese su correo electrónico',
                  label: 'Correo Electrónico',
                  icon: Icons.email_outlined,
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomFormInput(
              inputForm: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su número de teléfono';
                  }
                  return null;
                },
                style: const TextStyle(fontSize: 13),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ingrese su número de teléfono',
                  label: 'Teléfono',
                  icon: Icons.phone_android_outlined,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TextField(
                onChanged: (value) => ctrl.mensajePQRS = value,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: null,
                style: const TextStyle(fontSize: 13),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ingrese el mensaje que quiere enviar',
                  label: 'Mensaje',
                  icon: Icons.message_outlined,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: CustomOutlinedButton(
                fontSize: 18,
                width: size.width / 2,
                text: 'Comprar',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
