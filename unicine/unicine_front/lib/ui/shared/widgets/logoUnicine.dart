import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoUnicine extends StatelessWidget {
  const LogoUnicine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.camera_roll_outlined, color: Color(0xffD5C6E0)),
        const SizedBox(width: 10),
        Text(
          'Uni',
          style: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          'CINE',
          style: GoogleFonts.ptSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
