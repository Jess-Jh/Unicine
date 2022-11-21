import 'package:flutter_meedu/ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni_cine/main.dart';
import 'package:uni_cine/router/router.dart';
import 'package:uni_cine/ui/layouts/unicine_layout_page.dart';
import 'package:uni_cine/ui/shared/appbar/custom_app_menu.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/views/custom_card_view.dart';
import 'package:uni_cine/utils/custom_colors.dart';

class ActivateCount extends ConsumerWidget {
  const ActivateCount({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(clientProvider);

    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: CustomCardView(
        title: 'Activar Cuenta',
        sizeLetter: 40,
        formView: ActivateCountUser(),
      ),
    );
  }
}

class ActivateCountUser extends StatelessWidget {
  const ActivateCountUser({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: size.height / 1.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
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
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Uni',
                      style: GoogleFonts.rubik(
                        fontSize: 120,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Cine',
                      style: GoogleFonts.rubik(
                        fontSize: 120,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height / 7),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'De clic en el botón para activar la cuenta.',
                  style: GoogleFonts.rubik(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Consumer(builder: (context, ref, _) {
                  final ctrl = ref.watch(authProvider);
                  return CustomOutlinedButton(
                    fontSize: 18,
                    width: size.width / 2,
                    height: 15,
                    text: 'Activar Cuenta',
                    onPressed: () async {
                      await ctrl.activateCount(context);

                      if (ctrl.loading == false) {
                        navigateTo(Flurorouter.billboardRoute);
                      }
                    },
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
