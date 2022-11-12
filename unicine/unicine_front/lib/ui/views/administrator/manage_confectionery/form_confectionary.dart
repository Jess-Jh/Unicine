import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/shared/inputs/custom_inputs.dart';

class FormConfectionary extends ConsumerWidget {
  final int? id;
  const FormConfectionary({super.key, this.id});

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(confectioneryProvider);

    return SizedBox(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: ctrl.formConfectioneryKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: ctrl.editConfectionery?.nombre ?? '',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese el nombre del producto';
                }
                return null;
              },
              onChanged: (value) => ctrl.nombre = value,
              keyboardType: TextInputType.name,
              style: const TextStyle(fontSize: 13),
              decoration: CustomInputs.loginInputDecoration(
                hint: 'Ingrese el nombre del producto',
                label: 'Producto',
                icon: Icons.fastfood_outlined,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: ctrl.editConfectionery?.precio.toString() ?? '',
              validator: (value) {
                var intValue = double.tryParse(value!);
                if (value.isEmpty) {
                  return 'Ingrese el precio del producto';
                }
                if (intValue == null) {
                  return 'El precio debe ser de tipo numérico';
                }
                return null;
              },
              onChanged: (value) => ctrl.precio = value,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 13),
              decoration: CustomInputs.loginInputDecoration(
                hint: 'Ingrese el precio del producto',
                label: 'Precio',
                icon: Icons.attach_money_rounded,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: ctrl.editConfectionery?.imagen ?? '',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Agregue la Url de la imagen';
                }
                return null;
              },
              onChanged: (value) => ctrl.urlImagen = value,
              style: const TextStyle(fontSize: 13),
              decoration: CustomInputs.loginInputDecoration(
                hint: 'Agregue la Url de la imagen',
                label: 'Url Imagen',
                icon: Icons.image_outlined,
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
                        ctrl.formConfectioneryKey,
                      );
                      if (!validForm) return;
                      if (ctrl.editConfectionery == null) {
                        await ctrl.newConfectionery(context);
                      } else {
                        await ctrl.updateConfectionery(context);
                      }
                    },
                    text: 'Guardar',
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
