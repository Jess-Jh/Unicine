import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/inputs/custom_form_input.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/shared/inputs/custom_inputs.dart';

class FormRoom extends StatelessWidget {
  const FormRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Column(
        children: [
          CustomFormInput(
            inputForm: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese el nombre de la sala';
                }
                return null;
              },
              obscureText: true,
              keyboardType: TextInputType.name,
              style: const TextStyle(fontSize: 13),
              decoration: CustomInputs.loginInputDecoration(
                hint: 'Ingrese el nombre de la sala',
                label: 'Nombre Sala',
                icon: Icons.meeting_room_outlined,
              ),
            ),
          ),
          const SizedBox(height: 10),
          CustomFormInput(
            inputForm: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Seleccione la distribución de las sillas';
                }
                return null;
              },
              obscureText: true,
              keyboardType: TextInputType.name,
              style: const TextStyle(fontSize: 13),
              decoration: CustomInputs.loginInputDecoration(
                hint: 'Seleccione la distribución de las sillas',
                label: 'Sillas',
                icon: Icons.chair_alt_outlined,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomOutlinedButton(
                  onPressed: () {},
                  text: 'Guardar',
                  width: 300,
                  height: 8,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CustomOutlinedButton(
                  onPressed: () {},
                  text: 'Actualizar',
                  width: 300,
                  height: 8,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
