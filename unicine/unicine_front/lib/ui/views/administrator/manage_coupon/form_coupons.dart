import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/shared/inputs/custom_inputs.dart';
import 'package:uni_cine/utils/custom_colors.dart';

class FormCoupons extends ConsumerWidget {
  final int? id;
  const FormCoupons({super.key, this.id});

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(couponProvider);

    return SizedBox(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: ctrl.formCouponKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: ctrl.valorDescuento.toString(),
              validator: (value) {
                var doubleValue = double.tryParse(value!);
                if (value.isEmpty) {
                  return 'Ingrese el valor de descuento';
                }
                if (doubleValue == null) {
                  return 'El descuento debe ser de tipo numérico';
                }
                return null;
              },
              onChanged: (value) => ctrl.valorDescuento = value,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 13),
              decoration: CustomInputs.loginInputDecoration(
                hint: 'Ingrese el valor de descuento',
                label: 'Descuento',
                icon: Icons.money_off_csred,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.principal.withOpacity(0.9),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
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
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: ctrl.editCoupon?.descripcion ?? '',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese la descripción';
                }
                return null;
              },
              onChanged: (value) => ctrl.descripcion = value,
              style: const TextStyle(fontSize: 13),
              decoration: CustomInputs.loginInputDecoration(
                hint: 'Ingrese la descripción',
                label: 'Descripción',
                icon: Icons.library_books_outlined,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: ctrl.editCoupon?.criterio ?? '',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese el criterio';
                }
                return null;
              },
              onChanged: (value) => ctrl.criterio = value,
              style: const TextStyle(fontSize: 13),
              decoration: CustomInputs.loginInputDecoration(
                hint: 'Ingrese el criterio',
                label: 'Criterio',
                icon: Icons.credit_score_sharp,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomOutlinedButton(
                    onPressed: () async {
                      final validForm = ctrl.validateForm(
                        ctrl.formCouponKey,
                      );
                      if (!validForm) return;
                      if (ctrl.editCoupon == null) {
                        await ctrl.newCoupon(context);
                      } else {
                        await ctrl.updateCoupon(context);
                      }
                    },
                    text: 'Guardar',
                    width: 300,
                    height: 8,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
