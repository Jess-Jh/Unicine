import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/inputs/custom_form_input.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/shared/inputs/custom_inputs.dart';

class FormConfectionary extends StatelessWidget {
  const FormConfectionary({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Column(
        children: [
          CustomFormInput(
            inputForm: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese el nombre del producto';
                }
                return null;
              },
              obscureText: true,
              keyboardType: TextInputType.name,
              style: const TextStyle(fontSize: 13),
              decoration: CustomInputs.loginInputDecoration(
                hint: 'Ingrese el nombre del producto',
                label: 'Producto',
                icon: Icons.fastfood_outlined,
              ),
            ),
          ),
          const SizedBox(height: 10),
          CustomFormInput(
            inputForm: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese el precio del producto';
                }
                return null;
              },
              obscureText: true,
              keyboardType: TextInputType.name,
              style: const TextStyle(fontSize: 13),
              decoration: CustomInputs.loginInputDecoration(
                hint: 'Ingrese el precio del producto',
                label: 'Precio',
                icon: Icons.attach_money_rounded,
              ),
            ),
          ),
          const SizedBox(height: 10),
          CustomFormInput(
            inputForm: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Agregue la Url de la imagen';
                }
                return null;
              },
              obscureText: true,
              keyboardType: TextInputType.name,
              style: const TextStyle(fontSize: 13),
              decoration: CustomInputs.loginInputDecoration(
                hint: 'Agregue la Url de la imagen',
                label: 'Url Imagen',
                icon: Icons.image_outlined,
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
