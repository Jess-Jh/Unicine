import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoUnicine extends StatelessWidget {
  final Color? uniColor;
  final Color? cineColor;
  final double? letterSize;
  final bool? showIcon;
  const LogoUnicine({
    super.key,
    this.uniColor,
    this.cineColor,
    this.letterSize,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    GoogleFonts.nunito();
    GoogleFonts.ptSans();

    return FutureBuilder(
      future: pendingFontLoads(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (showIcon!) ...[
              const Icon(Icons.camera_roll_outlined, color: Color(0xffD5C6E0)),
              const SizedBox(width: 10)
            ],
            Text(
              'Uni',
              style: GoogleFonts.nunito(
                fontSize: letterSize ?? 25,
                fontWeight: FontWeight.bold,
                color: uniColor ?? Colors.white,
              ),
            ),
            Text(
              'CINE',
              style: GoogleFonts.ptSans(
                fontSize: letterSize ?? 25,
                fontWeight: FontWeight.bold,
                color: cineColor ?? Colors.black,
              ),
            ),
          ],
        );
      },
    );
  }

  Future<List<TextStyle>> pendingFontLoads() async {
    List<TextStyle> fonts = [GoogleFonts.nunito(), GoogleFonts.ptSans()];

    return fonts;
  }
}
