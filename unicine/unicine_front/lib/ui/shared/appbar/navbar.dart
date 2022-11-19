import 'package:flutter/material.dart';
import 'package:uni_cine/controllers/sidemenu_controller.dart';
import 'package:uni_cine/main.dart';
import 'package:uni_cine/router/router.dart';
import 'package:uni_cine/ui/shared/appbar/custom_app_menu.dart';
import 'package:uni_cine/ui/shared/buttons/custom_navbar_button.dart';

class Navbar extends StatelessWidget {
  final String text;
  final String? text2;

  const Navbar({super.key, required this.text, this.text2});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
          if (text2 != null && (!authProvider.read.buttonAuthenticated!)) ...[
            CustomNavbarButton(
              onPressed: () =>
                  Navigator.pushNamed(context, Flurorouter.registerRoute),
              text: text2!,
            ),
            const SizedBox(width: 10),
            CustomNavbarButton(
              onPressed: () => authProvider.read.logout(),
              text: text,
            ),
          ],
          if (text2 == null) ...[
            CustomNavbarButton(
              onPressed: () => authProvider.read.logout(),
              text: text,
            ),
            const SizedBox(width: 10),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => navigateTo(Flurorouter.userDetailsRoute),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: Image.network(
                      'https://via.placeholder.com/150',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.person);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
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
