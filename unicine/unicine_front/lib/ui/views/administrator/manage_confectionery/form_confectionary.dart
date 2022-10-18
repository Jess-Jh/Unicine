import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/inputs/custom_form_input.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';

class FormConfectionary extends StatelessWidget {
  const FormConfectionary({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Column(
        children: [
          const CustomFormInput(
            hint: 'Ingrese el nombre del producto',
            label: 'Nombre',
            icon: Icons.fastfood_outlined,
          ),
          const SizedBox(height: 10),
          const CustomFormInput(
            hint: 'Ingrese el precio del producto',
            label: 'Precio',
            icon: Icons.attach_money_rounded,
          ),
          const SizedBox(height: 10),
          const CustomFormInput(
            hint: 'Agregue la Url de la imagen',
            label: 'Url imagen',
            icon: Icons.image_outlined,
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
