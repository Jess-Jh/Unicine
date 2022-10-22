import 'package:flutter/material.dart';
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

class _TabletDesktopMenu extends StatelessWidget {
  final Size size;
  const _TabletDesktopMenu({required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 2,
      width: size.width,
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
            children: const [
              CustomFormInput(
                hint: 'Nombre cliente',
                label: 'Nombre',
                icon: Icons.people_alt_outlined,
              ),
              SizedBox(width: 20),
              CustomFormInput(
                hint: 'Ciudad',
                label: 'Ciudad',
                icon: Icons.location_city_rounded,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              CustomFormInput(
                hint: 'Ingrese su correo electrónico',
                label: 'Correo Electrónico',
                icon: Icons.email_outlined,
              ),
              SizedBox(width: 20),
              CustomFormInput(
                hint: 'Ingrese su número de teléfono',
                label: 'Teléfono',
                icon: Icons.phone_android_outlined,
              ),
            ],
          ),
          const SizedBox(height: 30),
          Expanded(
            child: TextField(
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
          )
        ],
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  final Size size;
  const _MobileMenu({required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 2,
      width: size.width,
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
          const CustomFormInput(
            hint: 'Nombre cliente',
            label: 'Nombre',
            icon: Icons.people_alt_outlined,
          ),
          const SizedBox(height: 20),
          const CustomFormInput(
            hint: 'Ciudad',
            label: 'Ciudad',
            icon: Icons.location_city_rounded,
          ),
          const SizedBox(height: 20),
          const CustomFormInput(
            hint: 'Ingrese su correo electrónico',
            label: 'Correo Electrónico',
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: 20),
          const CustomFormInput(
            hint: 'Ingrese su número de teléfono',
            label: 'Teléfono',
            icon: Icons.phone_android_outlined,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: TextField(
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
          )
        ],
      ),
    );
  }
}
