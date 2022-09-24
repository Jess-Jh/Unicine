import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.admin_panel_settings_outlined,
              color: Color(0xff7A6BF5)),
          const SizedBox(width: 10),
          Text(
            'Gestión',
            style: GoogleFonts.montserratAlternates(
              fontSize: 20,
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
