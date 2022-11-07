import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

class CustomFormInput extends ConsumerWidget {
  final double? heigth;
  final TextFormField inputForm;

  const CustomFormInput({
    super.key,
    this.heigth,
    required this.inputForm,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Flexible(
      child: Container(
        height: heigth ?? 40,
        decoration: buildBoxDecoration(),
        child: inputForm,
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.1),
      );
}

/*
TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Ingrese $label';
            }
            return null;
          },
          onChanged: (value) => providerCtrl = value,
          obscureText: true,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 13),
          decoration: CustomInputs.loginInputDecoration(
            hint: hint,
            label: label,
            icon: icon,
          ),
        ),

        */