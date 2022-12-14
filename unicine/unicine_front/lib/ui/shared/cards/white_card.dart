import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:google_fonts/google_fonts.dart';

class WhiteCard extends ConsumerWidget {
  final String? title;
  final Widget child;
  final double? width;
  final double? sizeLetter;
  final bool isEdit;

  const WhiteCard({
    super.key,
    this.title,
    required this.child,
    this.width,
    this.sizeLetter,
    this.isEdit = false,
  });

  @override
  Widget build(BuildContext context, ref) {
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
            color: isEdit
                ? Colors.green.withOpacity(0.9)
                : Colors.grey.withOpacity(0.05),
            blurRadius: 5,
          )
        ],
      );
}
