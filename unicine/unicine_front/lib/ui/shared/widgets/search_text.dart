import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/custom_inputs.dart';

class SearchText extends StatelessWidget {
  const SearchText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: buildBoxDecoration(),
      child: TextField(
        decoration: CustomInputs.searchInputDecoration(
          hint: 'Buscar',
          icon: Icons.search_outlined,
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.1),
      );
}
