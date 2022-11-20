import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:uni_cine/main.dart';
import 'package:uni_cine/ui/layouts/unicine_layout_page.dart';
import 'package:uni_cine/ui/shared/buttons/custom_flat_button.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/shared/inputs/custom_form_input.dart';
import 'package:uni_cine/ui/shared/inputs/custom_inputs.dart';
import 'package:uni_cine/ui/views/unicine/user/table_purchase_client.dart';
import 'package:uni_cine/utils/custom_colors.dart';
import 'package:uni_cine/utils/custom_network_image.dart';

class UserDetails extends ConsumerWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;
    final ctrl = ref.watch(clientProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 40),
      child: Column(
        children: [
          if (size.width >= 720)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CustomNetworkImage(
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                    placeholder: Image.asset('assets/images/image_perfil.jpeg'),
                    imageUrl: authProvider.read.clientLogin?.imagenPerfil ?? '',
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: size.height / 2.5,
                  width: size.width / 1.5,
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: ctrl.formUserKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomFormInput(
                          inputForm: TextFormField(
                            initialValue: authProvider.read.clientLogin?.cedula,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Cédula';
                              }
                              return null;
                            },
                            onChanged: (value) => ctrl.cedula = value,
                            style: const TextStyle(fontSize: 13),
                            decoration: CustomInputs.loginInputDecoration(
                              hint: 'Cédula',
                              label: 'Cédula',
                              icon: Icons.credit_card,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomFormInput(
                          inputForm: TextFormField(
                            initialValue:
                                authProvider.read.clientLogin?.nombreCompleto,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nombre';
                              }
                              return null;
                            },
                            onChanged: (value) => ctrl.nombre = value,
                            style: const TextStyle(fontSize: 13),
                            decoration: CustomInputs.loginInputDecoration(
                              hint: 'Nombre',
                              label: 'Nombre Completo',
                              icon: Icons.credit_card,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomFormInput(
                          inputForm: TextFormField(
                            initialValue: authProvider
                                    .read.clientLogin?.telefonos?.first ??
                                '',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'teléfono';
                              }
                              return null;
                            },
                            onChanged: (value) => ctrl.telefono = value,
                            style: const TextStyle(fontSize: 13),
                            decoration: CustomInputs.loginInputDecoration(
                              hint: 'teléfono',
                              label: 'Teléfono',
                              icon: Icons.settings_cell_outlined,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomFormInput(
                          inputForm: TextFormField(
                            initialValue: authProvider.read.clientLogin?.email,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'correo';
                              }
                              return null;
                            },
                            onChanged: (value) => ctrl.email = value,
                            style: const TextStyle(fontSize: 13),
                            decoration: CustomInputs.loginInputDecoration(
                              hint: 'correo',
                              label: 'Correo electrónico',
                              icon: Icons.email_outlined,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
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
                                  Icons.library_books_sharp,
                                  color: Color(0xff8C8C8C),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Compras realizadas',
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                            onPressed: () async {
                              customModalPurchases(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          if (size.width < 720)
            SizedBox(
              height: size.height / 1.6,
              width: size.width / 1.5,
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: ctrl.formUserKey,
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomFormInput(
                      inputForm: TextFormField(
                        initialValue: authProvider.read.clientLogin?.cedula,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Cédula';
                          }
                          return null;
                        },
                        onChanged: (value) => ctrl.cedula = value,
                        style: const TextStyle(fontSize: 13),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: 'Cédula',
                          label: 'Cédula',
                          icon: Icons.credit_card,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomFormInput(
                      inputForm: TextFormField(
                        initialValue:
                            authProvider.read.clientLogin?.nombreCompleto,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nombre';
                          }
                          return null;
                        },
                        onChanged: (value) => ctrl.nombre = value,
                        style: const TextStyle(fontSize: 13),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: 'Nombre',
                          label: 'Nombre Completo',
                          icon: Icons.credit_card,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomFormInput(
                      inputForm: TextFormField(
                        initialValue:
                            authProvider.read.clientLogin?.telefonos?.first,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'teléfono';
                          }
                          return null;
                        },
                        onChanged: (value) => ctrl.telefono = value,
                        style: const TextStyle(fontSize: 13),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: 'teléfono',
                          label: 'Teléfono',
                          icon: Icons.settings_cell_outlined,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomFormInput(
                      inputForm: TextFormField(
                        initialValue: authProvider.read.clientLogin?.email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'correo';
                          }
                          return null;
                        },
                        onChanged: (value) => ctrl.email = value,
                        style: const TextStyle(fontSize: 13),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: 'correo',
                          label: 'Correo electrónico',
                          icon: Icons.email_outlined,
                        ),
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
                                  Icons.library_books_sharp,
                                  color: Color(0xff8C8C8C),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Compras realizadas',
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                            onPressed: () async {
                              customModalPurchases(context);
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
                              'Comprar Realizadas',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xff666666),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    CustomFlatButton(
                        isActive: true,
                        text: 'Mis Compras',
                        onPressed: () {
                          customModalPurchases(context);
                        }),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 30),
          CustomOutlinedButton(
            text: 'Guardar Cambios',
            onPressed: () {
              if (!ctrl.validateUserForm(ctrl.formUserKey)) return;
              ctrl.updateClient(context);
            },
          )
        ],
      ),
    );
  }

  Future<void> customModalPurchases(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return showCupertinoModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer(builder: (context, ref, _) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            height: 500,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const TablePurchaseClient(),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 35,
                    width: size.width / 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.principal,
                      ),
                      child: const Text('Cerrar'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(width: 30)
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
