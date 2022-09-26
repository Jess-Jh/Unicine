import 'package:flutter/material.dart';
import 'package:uni_cine/controllers/sidemenu_controller.dart';
import 'package:uni_cine/ui/shared/buttons/custom_navbar_button.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          if (size.width <= 700)
            IconButton(
              icon: const Icon(Icons.menu_outlined),
              onPressed: () => SideMenuController.openMenu(),
            ),
          const SizedBox(width: 5),

          // Search input
          // if (size.width > 400)
          //   ConstrainedBox(
          //     constraints: const BoxConstraints(maxWidth: 250),
          //     child: const SearchText(),
          //   ),
          const Spacer(),
          CustomNavbarButton(
            onPressed: () {},
            text: 'Cerrar Sesión',
          ),
          const SizedBox(width: 10)
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          )
        ],
      );
}
