import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni_cine/ui/shared/buttons/custom_flat_button.dart';

class NoPageFoundView extends StatelessWidget {
  const NoPageFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('404',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(
            'No se encontró la página',
            style: GoogleFonts.montserratAlternates(
                fontSize: 50, fontWeight: FontWeight.bold),
          ),
          CustomFlatButton(
              text: 'Regresar',
              onPressed: () => Navigator.pushNamed(context, '/stateful'))
        ],
      ),
    );
  }
}
