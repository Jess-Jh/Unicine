import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/inputs/custom_form_input.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';

class FormTheaters extends StatelessWidget {
  const FormTheaters({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Column(
        children: [
          const CustomFormInput(hint: 'Ingrese el nombre del teatro', label: 'Nombre', icon: Icons.theater_comedy_outlined),
          const SizedBox(height: 10),
          const CustomFormInput(hint: 'Ingrese la dirección del teatro', label: 'Dirección', icon: Icons.location_on_outlined),
          const SizedBox(height: 10),
          const CustomFormInput(hint: 'Aregue las salas', label: 'Salas', icon: Icons.three_p_outlined),
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
