import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/inputs/custom_form_input.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/shared/inputs/custom_inputs.dart';

class FormCoupons extends StatelessWidget {
  const FormCoupons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: Column(
        children: [
          CustomFormInput(
            inputForm: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese el valor de descuento';
                }
                return null;
              },
              obscureText: true,
              keyboardType: TextInputType.name,
              style: const TextStyle(fontSize: 13),
              decoration: CustomInputs.loginInputDecoration(
                hint: 'Ingrese el valor de descuento',
                label: 'Descuento',
                icon: Icons.money_off_csred,
              ),
            ),
          ),
          const SizedBox(height: 10),
          CustomFormInput(
            inputForm: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese la fecha de vencimiento';
                }
                return null;
              },
              obscureText: true,
              keyboardType: TextInputType.name,
              style: const TextStyle(fontSize: 13),
              decoration: CustomInputs.loginInputDecoration(
                hint: 'Ingrese la fecha de vencimiento',
                label: 'Fecha de vencimiento',
                icon: Icons.date_range_outlined,
              ),
            ),
          ),
          const SizedBox(height: 10),
          CustomFormInput(
            inputForm: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese la descripción';
                }
                return null;
              },
              obscureText: true,
              keyboardType: TextInputType.name,
              style: const TextStyle(fontSize: 13),
              decoration: CustomInputs.loginInputDecoration(
                hint: 'Ingrese la descripción',
                label: 'Descripción',
                icon: Icons.library_books_outlined,
              ),
            ),
          ),
          const SizedBox(height: 10),
          CustomFormInput(
            inputForm: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese el criterio';
                }
                return null;
              },
              obscureText: true,
              keyboardType: TextInputType.name,
              style: const TextStyle(fontSize: 13),
              decoration: CustomInputs.loginInputDecoration(
                hint: 'Ingrese el criterio',
                label: 'Criterio',
                icon: Icons.credit_score_sharp,
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
