import 'package:flutter/material.dart';

class CustomNavbarButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  const CustomNavbarButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size.fromWidth(110)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        backgroundColor: MaterialStateProperty.all(
          const Color(0xffD5C6E0).withOpacity(0.9),
        ),
      ),
      onPressed: () => onPressed(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 9, color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
