import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhiteCard extends StatelessWidget {
  final String? title;
  final Widget child;
  final double? width;
  final double? sizeLetter;

  const WhiteCard(
      {super.key,
      this.title,
      required this.child,
      this.width,
      this.sizeLetter});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                title!,
                style: GoogleFonts.roboto(
                  fontSize: sizeLetter ?? 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(),
            const SizedBox(height: 15)
          ],
          child,
          const SizedBox(height: 15)
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
            )
          ]);
}
