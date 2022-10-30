import 'package:flutter/material.dart';

class CustomInputData extends StatelessWidget {
  final String nameColumn;
  final String data;
  final double? height;
  const CustomInputData({
    super.key,
    required this.data,
    required this.nameColumn,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(10),
        height: height ?? 50,
        decoration: buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nameColumn,
              style: const TextStyle(fontSize: 10),
            ),
            Text(
              data,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
        color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
      );
}
