import 'package:flutter/material.dart';
import 'package:uni_cine/controllers/sidemenu_controller.dart';
import 'package:uni_cine/ui/shared/buttons/custom_navbar_button.dart';

class Navbar extends StatelessWidget {
  final String text;
  final String? text2;

  const Navbar({super.key, required this.text, this.text2});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          if (size.width < 720)
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
          if (text2 != null)
            CustomNavbarButton(
              onPressed: () {},
              text: text2!,
            ),

          const SizedBox(width: 10),
          CustomNavbarButton(
            onPressed: () {},
            text: text,
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
