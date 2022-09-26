import 'package:flutter/material.dart';
import 'package:uni_cine/services/navigation_service.dart';
import 'package:uni_cine/ui/shared/buttons/custom_flat_button.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (_, constraints) => (constraints.maxWidth > 520)
            ? _TabletDesktopMenu()
            : _MobileMenu());
  }
}

class _TabletDesktopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Row(
        children: [
          CustomFlatButton(
            text: 'Contador Stateful',
            // onPressed: () => Navigator.pushNamed(context, '/stateful'),
            onPressed: () => NavigationService.navigateTo('/stateful'),
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'Contador con meedu',
            onPressed: () => NavigationService.navigateTo('/meedu'),
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'Otra página',
            onPressed: () => NavigationService.navigateTo('/abc123'),
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'Stateful 100',
            onPressed: () => NavigationService.navigateTo('/stateful/100'),
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'Meedu 200',
            onPressed: () => NavigationService.navigateTo('/meedu?q=200'),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFlatButton(
            text: 'Contador Stateful',
            // onPressed: () => Navigator.pushNamed(context, '/stateful'),
            onPressed: () => NavigationService.navigateTo('/stateful'),
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'Contador con meedu',
            onPressed: () => NavigationService.navigateTo('/meedu'),
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'Otra página',
            onPressed: () => NavigationService.navigateTo('/abc123'),
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            text: 'Stateful 100',
            onPressed: () => NavigationService.navigateTo('/stateful/100'),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
