import 'package:flutter/material.dart';

class ScreenRoom extends StatelessWidget {
  const ScreenRoom({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey,
      height: 10,
      width: size.width / 1.6,
      child: const CustomPaint(),
    );
  }
}
