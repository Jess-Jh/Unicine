import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/custom_inputs.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';

class FormHours extends StatelessWidget {
  const FormHours({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: 40,
              decoration: buildBoxDecoration(),
              child: TextFormField(
                style: const TextStyle(fontSize: 13),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ingresa la fecha',
                  label: 'Fecha',
                  icon: Icons.date_range,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              height: 40,
              decoration: buildBoxDecoration(),
              child: TextFormField(
                style: const TextStyle(fontSize: 13),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Selecciona la hora',
                  label: 'Hora',
                  icon: Icons.history_toggle_off_outlined,
                ),
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

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.1),
      );
}
