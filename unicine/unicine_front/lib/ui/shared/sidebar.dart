import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import 'package:uni_cine/controllers/sidemenu_controller.dart';
import 'package:uni_cine/router/router.dart';
import 'package:uni_cine/services/navigation_service.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';

import 'package:uni_cine/ui/shared/widgets/custom_menu_item.dart';
import 'package:uni_cine/ui/shared/widgets/logo.dart';
import 'package:uni_cine/utils/custom_colors.dart';

class Sidebar extends ConsumerWidget {
  const Sidebar({super.key});

  void navigateTo(String routeName) {
    NavigationService.navigateTo(routeName);
    SideMenuController.closeMenu();
  }

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(sideMenuProvider);
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(height: 50),

          // TextSeparator( text: 'Películas' ),
          CustomMenuItem(
            text: 'Películas',
            icon: Icons.movie_creation_outlined,
            onPressed: () => navigateTo(Flurorouter.moviesRoute),
            isActive: ctrl.currentPage == Flurorouter.moviesRoute,
          ),

          CustomMenuItem(
            text: 'Teatros',
            icon: Icons.theaters_outlined,
            onPressed: () => navigateTo(Flurorouter.theatersRoute),
            isActive: ctrl.currentPage == Flurorouter.theatersRoute,
          ),

          CustomMenuItem(
            text: 'Confiterías',
            icon: Icons.fastfood_outlined,
            onPressed: () {},
          ),
          CustomMenuItem(
            text: 'Cupones',
            icon: Icons.turned_in_not_sharp,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        gradient: LinearGradient(
          colors: [
            CustomColors.principal,
            const Color(0xff092042),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
          )
        ],
      );
}
