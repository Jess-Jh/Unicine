import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/custom_inputs.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';

class FormConfectionary extends StatelessWidget {
  const FormConfectionary({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: 40,
              decoration: buildBoxDecoration(),
              child: TextFormField(
                style: const TextStyle(fontSize: 13),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ingrese el nombre del producto',
                  label: 'Nombre',
                  icon: Icons.fastfood_outlined,
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
                  hint: 'Ingrese el precio del producto',
                  label: 'Precio',
                  icon: Icons.attach_money_rounded,
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
                  hint: 'Agrega la Url de la image',
                  label: 'Url imagen',
                  icon: Icons.image_outlined,
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
