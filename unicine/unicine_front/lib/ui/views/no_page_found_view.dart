import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/utils/custom_colors.dart';

class NoPageFoundView extends StatelessWidget {
  const NoPageFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
            CustomColors.principal,
            CustomColors.themeWhite,
            const Color.fromARGB(255, 209, 209, 209),
          ],
              stops: const [
            0.5,
            0.5,
            0.8
          ],
              begin: FractionalOffset.centerLeft,
              end: FractionalOffset.centerRight)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '404',
                    style: GoogleFonts.rubik(
                      fontSize: 120,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'No se encontró \nla página',
                    style: GoogleFonts.rubik(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height / 7),
            Align(
              alignment: Alignment.center,
              child: CustomOutlinedButton(
                fontSize: 18,
                width: size.width / 2,
                height: 15,
                text: 'Regresar',
                onPressed: () =>
                    Navigator.pushNamed(context, '/unicine/cartelera'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
