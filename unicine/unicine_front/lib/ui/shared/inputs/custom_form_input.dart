import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/inputs/custom_inputs.dart';

class CustomFormInput extends StatelessWidget {
  final String hint;
  final String label;
  final IconData icon;
  final TextInputType? keyboardType;
  final double? heigth;

  const CustomFormInput({
    super.key,
    required this.hint,
    required this.label,
    required this.icon,
    this.keyboardType,
    this.heigth,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: heigth ?? 40,
        decoration: buildBoxDecoration(),
        child: TextFormField(
          keyboardType: keyboardType,
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
