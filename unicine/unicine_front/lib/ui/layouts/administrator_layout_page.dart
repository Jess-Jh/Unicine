import 'package:flutter/material.dart';

import 'package:uni_cine/controllers/sidemenu_controller.dart';
import 'package:uni_cine/ui/shared/appbar/animated_builder_sidebar.dart';
import 'package:uni_cine/ui/shared/appbar/navbar.dart';
import 'package:uni_cine/ui/shared/appbar/sidebar.dart';

class AdministratorLayoutPage extends StatefulWidget {
  final Widget child;
  const AdministratorLayoutPage({super.key, required this.child});

  @override
  State<AdministratorLayoutPage> createState() =>
      _AdministratorLayoutPageState();
}

class _AdministratorLayoutPageState extends State<AdministratorLayoutPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SideMenuController.menuController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffEDF1F2),
      body: Stack(
        children: [
          Row(
            children: [
              if (size.width >= 700) const Sidebar(),
              Expanded(
                child: Column(
                  children: [
                    // Navbar
                    const Navbar(text: 'Cerrar sesión'),

                    // View
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: widget.child,
                      ),
                    ),
                  ],
                ),
              ),

              // Contenedor de la view
            ],
          ),
          if (size.width < 700)
            AnimatedBuilderSidebar(
              size: size,
              sidebar: const Sidebar(),
            )
        ],
      ),
    );
  }
}
