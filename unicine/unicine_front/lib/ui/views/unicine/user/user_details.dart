import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/buttons/custom_flat_button.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/shared/inputs/custom_form_input.dart';
import 'package:uni_cine/ui/shared/inputs/custom_inputs.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 40),
      child: Column(
        children: [
          if (size.width >= 720)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: size.height / 2.5,
                  width: size.width / 1.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomFormInput(
                        inputForm: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Cédula';
                            }
                            return null;
                          },
                          obscureText: true,
                          keyboardType: TextInputType.name,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nombre';
                            }
                            return null;
                          },
                          obscureText: true,
                          keyboardType: TextInputType.name,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'teléfono';
                            }
                            return null;
                          },
                          obscureText: true,
                          keyboardType: TextInputType.name,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'correo';
                            }
                            return null;
                          },
                          obscureText: true,
                          keyboardType: TextInputType.name,
                          style: const TextStyle(fontSize: 13),
                          decoration: CustomInputs.loginInputDecoration(
                            hint: 'correo',
                            label: 'Correo electrónico',
                            icon: Icons.email_outlined,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomFlatButton(text: 'Mis Compras', onPressed: () {}),
                    ],
                  ),
                )
              ],
            ),
          if (size.width < 720)
            SizedBox(
              height: size.height / 1.6,
              width: size.width / 1.5,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Cédula';
                        }
                        return null;
                      },
                      obscureText: true,
                      keyboardType: TextInputType.name,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nombre';
                        }
                        return null;
                      },
                      obscureText: true,
                      keyboardType: TextInputType.name,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'teléfono';
                        }
                        return null;
                      },
                      obscureText: true,
                      keyboardType: TextInputType.name,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'correo';
                        }
                        return null;
                      },
                      obscureText: true,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(fontSize: 13),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'correo',
                        label: 'Correo electrónico',
                        icon: Icons.email_outlined,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomFlatButton(text: 'Mis Compras', onPressed: () {}),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          CustomOutlinedButton(onPressed: () {}, text: 'Guardar Cambios')
        ],
      ),
    );
  }
}
