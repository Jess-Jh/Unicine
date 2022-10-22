import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/inputs/custom_inputs.dart';

class CustomFormInput extends StatelessWidget {
  final String hint;
  final String label;
  final IconData icon;

  const CustomFormInput(
      {super.key, required this.hint, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 40,
        decoration: buildBoxDecoration(),
        child: TextFormField(
          style: const TextStyle(fontSize: 13),
          decoration: CustomInputs.loginInputDecoration(
            hint: hint,
            label: label,
            icon: icon,
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.1),
      );
}
