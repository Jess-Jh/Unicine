import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/shared/inputs/custom_inputs.dart';
import 'package:uni_cine/utils/util.dart';

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
              initialValue: ctrl.editCoupon?.valorDescuento.toString() ?? '',
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
            TextFormField(
              mouseCursor: MaterialStateMouseCursor.clickable,
              readOnly: true,
              initialValue: ctrl.editCoupon?.fechaVencimiento != null
                  ? getStringDateFromDateTime(
                      ctrl.editCoupon!.fechaVencimiento!)
                  : ctrl.fechaVencimiento != null
                      ? getStringDateFromDateTime(ctrl.fechaVencimiento!)
                      : '',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Seleccione la fecha de vencimiento';
                }

                return null;
              },
              onTap: () async {
                DateTime? dateCoupon = await customDatePicker(context);
                if (dateCoupon == null) return;
                ctrl.onChangeDate(dateCoupon);
                ctrl.fechaVencimiento = dateCoupon;
              },
              style: const TextStyle(fontSize: 13),
              decoration: CustomInputs.loginInputDecoration(
                hint: 'Seleccione la fecha de vencimiento',
                label: 'Fecha de vencimiento',
                icon: Icons.date_range_outlined,
              ),
            ),

            // Stack(
            //   clipBehavior: Clip.none,
            //   children: [
            //     SizedBox(
            //       height: 50,
            //       child: ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: Colors.white,
            //           side: const BorderSide(
            //             width: 1.0,
            //             color: Color(0xffBBBBBB),
            //           ),
            //           padding: const EdgeInsets.symmetric(
            //               horizontal: 10, vertical: 20),
            //           textStyle: const TextStyle(
            //             fontSize: 13,
            //             color: Colors.black,
            //           ),
            //         ),
            //         child: Row(
            //           children: [
            //             const Icon(
            //               Icons.date_range_outlined,
            //               color: Color(0xff8C8C8C),
            //             ),
            //             const SizedBox(width: 8),
            //             if (ctrl.chageDate)
            //               Text(
            //                 getStringDateFromDateTime(
            //                     ctrl.editCoupon?.fechaVencimiento! ??
            //                         ctrl.fechaVencimiento),
            //                 style: const TextStyle(color: Color(0xff222222)),
            //               ),
            //             if (!ctrl.chageDate)
            //               Text(
            //                 'Seleccione la fecha de vencimiento',
            //                 style: TextStyle(color: Colors.grey[600]),
            //               ),
            //           ],
            //         ),
            //         onPressed: () async {
            //           DateTime? dateCoupon = await customDatePicker(context);

            //           if (dateCoupon == null) return;
            //           ctrl.onChangeDate(dateCoupon);
            //         },
            //       ),
            //     ),
            //     Positioned(
            //       top: -7,
            //       left: 37,
            //       child: Container(
            //         alignment: Alignment.center,
            //         width: 100,
            //         color: Colors.white,
            //         child: const Text(
            //           'Fecha vencimiento',
            //           style: TextStyle(
            //             fontSize: 11,
            //             color: Color(0xff666666),
            //           ),
            //         ),
            //       ),
            //     )
            //   ],
            // ),
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
