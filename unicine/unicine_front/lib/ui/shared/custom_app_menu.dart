import 'package:flutter/material.dart';
import 'package:uni_cine/services/navigation_service.dart';
import 'package:uni_cine/ui/shared/buttons/custom_flat_button.dart';
import 'package:uni_cine/ui/shared/widgets/logoUnicine.dart';
import 'package:uni_cine/utils/custom_colors.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return (size.width >= 700) ? _TabletDesktopMenu() : _MobileMenu();
  }
}

class _TabletDesktopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            // onPressed: () => Navigator.pushNamed(context, '/stateful'),
            onPressed: () => NavigationService.navigateTo('/stateful'),
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'TEATROS',
            onPressed: () => NavigationService.navigateTo('/meedu'),
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'CONFITERÍA',
            onPressed: () => NavigationService.navigateTo('/abc123'),
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'MEMBRESÍA',
            onPressed: () => NavigationService.navigateTo('/stateful/100'),
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'PQRS',
            onPressed: () => NavigationService.navigateTo('/meedu?q=200'),
            color: Colors.white,
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

class _MobileMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            // onPressed: () => Navigator.pushNamed(context, '/stateful'),
            onPressed: () => NavigationService.navigateTo('/stateful'),
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'TEATROS',
            onPressed: () => NavigationService.navigateTo('/meedu'),
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'CONFITERÍA',
            onPressed: () => NavigationService.navigateTo('/abc123'),
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'MEMBRESÍA',
            onPressed: () => NavigationService.navigateTo('/stateful/100'),
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'PQRS',
            onPressed: () => NavigationService.navigateTo('/meedu?q=200'),
            color: Colors.white,
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
