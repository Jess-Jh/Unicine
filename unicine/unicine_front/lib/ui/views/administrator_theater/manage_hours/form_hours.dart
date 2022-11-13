import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/ui/layouts/administrator_theater_layout.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/shared/inputs/custom_inputs.dart';
import 'package:uni_cine/utils/util.dart';

class FormHours extends ConsumerWidget {
  final int? id;
  const FormHours({super.key, this.id});

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(hourProvider);

    return SizedBox(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: ctrl.formHourKey,
        child: Column(
          children: [
            TextFormField(
              mouseCursor: MaterialStateMouseCursor.clickable,
              readOnly: true,
              initialValue: ctrl.editHour?.fecha != null
                  ? getStringDateFromDateTime(ctrl.editHour!.fecha!)
                  : ctrl.fecha != null
                      ? getStringDateFromDateTime(ctrl.fecha!)
                      : '',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Seleccione la fecha';
                }

                return null;
              },
              onTap: () async {
                DateTime? dateCoupon = await customDatePicker(context);
                if (dateCoupon == null) return;
                ctrl.onChangeDate(dateCoupon);
                ctrl.fecha = dateCoupon;
              },
              style: const TextStyle(fontSize: 13),
              decoration: CustomInputs.loginInputDecoration(
                hint: 'Seleccione la fecha',
                label: 'Fecha',
                icon: Icons.date_range_outlined,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              mouseCursor: MaterialStateMouseCursor.clickable,
              readOnly: true,
              initialValue: ctrl.editHour?.hora != null
                  ? ctrl.editHour!.hora!
                  : ctrl.hora != ''
                      ? ctrl.hora
                      : '',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Seleccione la hora';
                }
                return null;
              },
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                );
                if (time == null) return;
                ctrl.onChangeTime(time);
              },
              style: const TextStyle(fontSize: 13),
              decoration: CustomInputs.loginInputDecoration(
                hint: 'Seleccione la hora',
                label: 'Hora',
                icon: Icons.more_time_rounded,
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
                        ctrl.formHourKey,
                      );
                      if (!validForm) return;
                      if (ctrl.editHour == null) {
                        await ctrl.newHour(context);
                      } else {
                        await ctrl.updateHour(context);
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
