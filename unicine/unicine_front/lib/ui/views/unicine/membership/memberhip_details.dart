import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'dart:math' as math;
import 'package:uni_cine/ui/shared/inputs/custom_form_input.dart';
import 'package:uni_cine/ui/shared/inputs/custom_inputs.dart';

class MembershipDetails extends StatelessWidget {
  const MembershipDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: size.height / 2,
        child: Column(
          children: [
            if (size.width >= 800)
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Spacer(),
                          CustomFormInput(
                            inputForm: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Ingrese su correo electrónico';
                                }
                                return null;
                              },
                              obscureText: true,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(fontSize: 13),
                              decoration: CustomInputs.loginInputDecoration(
                                hint: 'Ingrese su correo electrónico',
                                label: 'Correo Electrónico',
                                icon: Icons.email_outlined,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomFormInput(
                            inputForm: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Ingrese la contraseña';
                                }
                                return null;
                              },
                              obscureText: true,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(fontSize: 13),
                              decoration: CustomInputs.loginInputDecoration(
                                hint: 'Ingrese la contraseña',
                                label: 'Contraseña',
                                icon: Icons.password_rounded,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Spacer()
                        ],
                      ),
                    ),
                    const SizedBox(width: 60),
                    _membershipCard(size.width)
                  ],
                ),
              ),
            if (size.width < 800)
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Spacer(),
                          CustomFormInput(
                            inputForm: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Ingrese su correo electrónico';
                                }
                                return null;
                              },
                              obscureText: true,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(fontSize: 13),
                              decoration: CustomInputs.loginInputDecoration(
                                hint: 'Ingrese su correo electrónico',
                                label: 'Correo Electrónico',
                                icon: Icons.email_outlined,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomFormInput(
                            inputForm: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Ingrese la contraseña';
                                }
                                return null;
                              },
                              obscureText: true,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(fontSize: 13),
                              decoration: CustomInputs.loginInputDecoration(
                                hint: 'Ingrese la contraseña',
                                label: 'Contraseña',
                                icon: Icons.password_rounded,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Spacer()
                        ],
                      ),
                    ),
                    const SizedBox(width: 60),
                    _membershipCard(size.width)
                  ],
                ),
              ),
            const SizedBox(height: 20),
            CustomOutlinedButton(
              fontSize: 18,
              width: size.width / 2,
              text: 'Comprar',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Expanded _membershipCard(size) {
    return size >= 800
        ? Expanded(
            child: Transform.rotate(
              angle: math.pi / 28,
              child: Container(
                padding: const EdgeInsets.all(20),
                height: 280,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: const [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Tarjeta de Membresía',
                        style: TextStyle(fontSize: 23, color: Colors.grey),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Descuento de 30% en boletería,\n 20% de descuento en confitería.',
                      style: TextStyle(fontSize: 23, color: Colors.grey),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        r'Valor $20.000',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Expanded(
            child: Transform.rotate(
              angle: math.pi / 40,
              child: Container(
                padding: const EdgeInsets.all(20),
                height: 280,
                width: 530,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: const [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Tarjeta de Membresía',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Descuento de 30% en boletería,\n 20% de descuento en confitería.',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        r'Valor $20.000',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
