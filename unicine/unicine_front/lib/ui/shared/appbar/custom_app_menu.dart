import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/controllers/sidemenu_controller.dart';
import 'package:uni_cine/main.dart';
import 'package:uni_cine/router/router.dart';
import 'package:uni_cine/services/navigation_service.dart';
import 'package:uni_cine/ui/shared/buttons/custom_flat_button.dart';
import 'package:uni_cine/ui/shared/widgets/logoUnicine.dart';
import 'package:uni_cine/utils/custom_colors.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return (size.width >= 700)
        ? _TabletDesktopMenu()
        : _MobileMenu();
  }
}

void navigateTo(String routeName) {
  NavigationService.navigateTo(routeName);
  SideMenuController.closeMenu();
}

class _TabletDesktopMenu extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(sideMenuProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: double.infinity,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          const LogoUnicine(),
          const Spacer(),
          CustomFlatButton(
            text: 'CARTELERA',
            color: Colors.white,
            onPressed: () => navigateTo(Flurorouter.billboardRoute),
            isActive: ctrl.currentPage == Flurorouter.billboardRoute,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'TEATROS',
            color: Colors.white,
            onPressed: () {},
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'CONFITERÍA',
            color: Colors.white,
            onPressed: () {},
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'MEMBRESÍA',
            color: Colors.white,
            onPressed: () {},
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'PQRS',
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  buildBoxDecoration() => BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 13, 56, 121),
            CustomColors.principal,
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

class _MobileMenu extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(sideMenuProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: 200,
      decoration: buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LogoUnicine(),
          const SizedBox(height: 30),
          CustomFlatButton(
            text: 'CARTELERA',
            color: Colors.white,
            onPressed: () => navigateTo(Flurorouter.billboardRoute),
            isActive: ctrl.currentPage == Flurorouter.billboardRoute,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'TEATROS',
            color: Colors.white,
            onPressed: () {},
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'CONFITERÍA',
            color: Colors.white,
            onPressed: () {},
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'MEMBRESÍA',
            color: Colors.white,
            onPressed: () {},
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'PQRS',
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  buildBoxDecoration() => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            const Color.fromARGB(255, 13, 56, 121),
            CustomColors.principal,
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
