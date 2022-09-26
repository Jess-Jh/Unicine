import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color colorText;
  final Color colorButton;
  final double? width;
  final double? height;
  final double? fontSize;
  static const Color color = Color(0xff192A51);

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.colorText = Colors.white,
    this.colorButton = color,
    this.width = 440,
    this.height = 10,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size.fromWidth(width!)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        backgroundColor: MaterialStateProperty.all(
          colorButton.withOpacity(0.9),
        ),
      ),
      onPressed: () => onPressed(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: height!),
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize, color: colorText),
        ),
      ),
    );
  }
}
