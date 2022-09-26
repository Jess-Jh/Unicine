import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import 'package:uni_cine/controllers/sidemenu_controller.dart';
import 'package:uni_cine/router/router.dart';
import 'package:uni_cine/services/navigation_service.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';

import 'package:uni_cine/ui/shared/widgets/custom_menu_item.dart';
import 'package:uni_cine/ui/shared/widgets/logo.dart';
import 'package:uni_cine/ui/shared/widgets/text_separator.dart';
import 'package:uni_cine/utils/custom_colors.dart';

class SidebarAdministratorTheater extends ConsumerWidget {
  const SidebarAdministratorTheater({super.key});

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
          const TextSeparator(text: 'Administrador Teatro'),
          CustomMenuItem(
            text: 'Salas',
            icon: Icons.personal_video_rounded,
            onPressed: () => navigateTo(Flurorouter.roomRoute),
            isActive: ctrl.currentPage == Flurorouter.roomRoute,
          ),
          CustomMenuItem(
            text: 'Horarios',
            icon: Icons.history_toggle_off_rounded,
            onPressed: () => navigateTo(Flurorouter.hourRoute),
            isActive: ctrl.currentPage == Flurorouter.hourRoute,
          ),
          CustomMenuItem(
            text: 'Funciones',
            icon: Icons.slow_motion_video_rounded,
            onPressed: () => navigateTo(Flurorouter.functionRoute),
            isActive: ctrl.currentPage == Flurorouter.functionRoute,
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
