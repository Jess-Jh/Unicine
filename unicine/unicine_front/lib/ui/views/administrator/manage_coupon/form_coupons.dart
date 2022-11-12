import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/ui/shared/inputs/custom_form_input.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/shared/inputs/custom_inputs.dart';
import 'package:uni_cine/utils/custom_colors.dart';

class FormCoupons extends ConsumerWidget {
  const FormCoupons({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(couponProvider);

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
          SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.principal.withOpacity(0.9),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  textStyle: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold)),
              child: Row(
                children: [
                  const Icon(Icons.date_range_outlined),
                  const SizedBox(width: 8),
                  if (ctrl.chageDate) Text(ctrl.fechaVencimiento.toString()),
                  if (!ctrl.chageDate)
                    const Text('Seleccione la fecha de vencimiento'),
                ],
              ),
              onPressed: () async {
                DateTime? dateCoupon = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1992),
                  lastDate: DateTime(3000),
                );

                if (dateCoupon == null) return;
                ctrl.onChangeDate(dateCoupon);
              },
              // TextFormField(
              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return 'Ingrese la fecha de vencimiento';
              //       }
              //       return null;
              //     },
              //     obscureText: true,
              //     keyboardType: TextInputType.name,
              //     style: const TextStyle(fontSize: 13),
              //     decoration: CustomInputs.loginInputDecoration(
              //       hint: 'Ingrese la fecha de vencimiento',
              //       label: 'Fecha de vencimiento',
              //       icon: Icons.date_range_outlined,
              //     ),
              //   ),
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
