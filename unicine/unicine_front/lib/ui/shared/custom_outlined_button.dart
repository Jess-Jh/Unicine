import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color colorText;
  final Color colorButton;
  static const Color color = Color(0xff192A51);

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.colorText = Colors.white,
    this.colorButton = color,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size.fromWidth(440)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        backgroundColor: MaterialStateProperty.all(
          colorButton.withOpacity(0.9),
        ),
      ),
      onPressed: () => onPressed(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, color: colorText),
        ),
      ),
    );
  }
}
