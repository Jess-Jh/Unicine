import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:uni_cine/ui/layouts/administrator_theater_layout.dart';
import 'package:uni_cine/ui/shared/buttons/custom_flat_button.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/shared/inputs/custom_inputs.dart';
import 'package:uni_cine/ui/shared/type_init_chairs.dart';
import 'package:uni_cine/ui/views/unicine/room_unicine/chairs_location.dart';
import 'package:uni_cine/utils/custom_colors.dart';
import 'package:uni_cine/utils/custom_labels.dart';

class FormRoom extends ConsumerWidget {
  final int? id;
  const FormRoom({super.key, this.id});

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(roomManageProvider);

    return SizedBox(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: ctrl.formManageRoomKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: ctrl.editRoom?.nombre ?? '',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese el nombre de la sala';
                }
                return null;
              },
              onChanged: (value) => ctrl.nombre = value,
              keyboardType: TextInputType.name,
              style: const TextStyle(fontSize: 13),
              decoration: CustomInputs.loginInputDecoration(
                hint: 'Ingrese el nombre de la sala',
                label: 'Nombre Sala',
                icon: Icons.meeting_room_outlined,
              ),
            ),

            const SizedBox(height: 10),

            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                        width: 1.0,
                        color: Color(0xffBBBBBB),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      textStyle: const TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.chair_alt_outlined,
                          color: Color(0xff8C8C8C),
                        ),
                        const SizedBox(width: 8),
                        if (ctrl.changeDistributionChairs)
                          Text(
                            ctrl.editRoom?.distribucionSilla != null
                                ? 'Columnas ${ctrl.editRoom?.distribucionSilla!.columnas}, filas ${ctrl.editRoom?.distribucionSilla!.filas}, cantidad de sillas ${ctrl.editRoom?.distribucionSilla!.totalSillas}'
                                : 'Columnas ${ctrl.distribucionSillas?.columnas}, filas ${ctrl.distribucionSillas?.filas}, cantidad de sillas ${ctrl.distribucionSillas?.totalSillas}',
                            style: const TextStyle(color: Color(0xff222222)),
                          ),
                        if (!ctrl.changeDistributionChairs)
                          Text(
                            'Seleccione la distribución de sillas para la sala',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                      ],
                    ),
                    onPressed: () async {
                      String? distributionChairs = '';

                      if (distributionChairs == null) return;
                      // ctrl.onChangeDistributionChairs(distributionChairs);
                      customModalRoom(context);
                    },
                  ),
                ),
                Positioned(
                  top: -7,
                  left: 37,
                  child: Container(
                    alignment: Alignment.center,
                    width: 120,
                    color: Colors.white,
                    child: const Text(
                      'Distribución de sillas',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xff666666),
                      ),
                    ),
                  ),
                )
              ],
            ),

            // DropdownButtonFormField2(
            //   validator: (value) {
            //     if (value == null) {
            //       return 'Seleccione la distribución de sillas para la sala';
            //     }
            //     return null;
            //   },
            //   onChanged: (value) {},
            //   onSaved: (newValue) =>
            //       ctrl.distribucionSillas = newValue.toString(),
            //   style: const TextStyle(fontSize: 13),
            //   items: ctrlChairs.listDistributionChairs.map((chair) {
            //     return DropdownMenuItem(
            //         value: chair.idDistribucionSilla,
            //         child: Text(
            //             'Número de columnas ${chair.columnas}, número de filas ${chair.filas}, número total de sillas ${chair.totalSillas}'));
            //   }).toList(),
            //   decoration: CustomInputs.loginInputDecoration(
            //     hint: 'Seleccione la distribución de las sillas',
            //     label: 'Distribución Sillas',
            //     icon: Icons.chair_alt_outlined,
            //   ),
            //   dropdownDecoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //   ),
            // ),

            // CustomFormInput(
            //   inputForm: TextFormField(
            //     validator: (value) {
            //       if (value == null || value.isEmpty) {
            //         return 'Seleccione la distribución de las sillas';
            //       }
            //       return null;
            //     },
            //     obscureText: true,
            //     keyboardType: TextInputType.name,
            //     style: const TextStyle(fontSize: 13),
            //     decoration: CustomInputs.loginInputDecoration(
            //       hint: 'Seleccione la distribución de las sillas',
            //       label: 'Sillas',
            //       icon: Icons.chair_alt_outlined,
            //     ),
            //   ),
            // ),
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> customModalRoom(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int valuePg = 0;
    return showCupertinoModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer(builder: (context, ref, _) {
          final ctrl = ref.watch(roomManageProvider);
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            height: 900,
            width: size.width,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Column(
              children: <Widget>[
                Text(
                  'Tipos Distribución Sillas',
                  style: CustomLabels.h1,
                ),
                Expanded(
                  child: PageView(
                    controller: ctrl.formPageController,
                    children: [
                      Center(
                          child: ChairsLocation(
                        chairs: TypeInitChars.initChairs(),
                        cantColums: 23,
                      )),
                      Center(
                          child: ChairsLocation(
                        chairs: TypeInitChars.type2(),
                        cantColums: 33,
                      )),
                      Center(
                          child: ChairsLocation(
                        chairs: TypeInitChars.type3(),
                        cantColums: 23,
                      )),
                    ],
                    onPageChanged: (value) => valuePg = value,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (ctrl.valuePage != 0)
                      CustomFlatButton(
                        text: '<< Anterior ',
                        onPressed: () {
                          if (ctrl.loading == false) {
                            ctrl.previusPageTypeRoom();
                          }
                        },
                      ),
                    const SizedBox(width: 30),
                    SizedBox(
                      height: 35,
                      width: size.width / 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.principal,
                        ),
                        child: const Text('Seleccionar distribución'),
                        onPressed: () {
                          ctrl.idDistribucionSillas = valuePg++;

                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const SizedBox(width: 30),
                    if (ctrl.valuePage < 2)
                      CustomFlatButton(
                        text: 'Siguiente >>',
                        onPressed: () {
                          if (ctrl.loading == false) {
                            ctrl.nextPageTypeRoom();
                          }
                        },
                      ),
                  ],
                )
              ],
            ),
          );
        });
      },
    );
  }
}
