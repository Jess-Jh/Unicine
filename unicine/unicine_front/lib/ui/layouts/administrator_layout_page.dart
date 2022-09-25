import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';

import 'package:uni_cine/controllers/sidemenu_controller.dart';

import 'package:uni_cine/ui/shared/navbar.dart';
import 'package:uni_cine/ui/shared/sidebar.dart';

final sideMenuProvider = SimpleProvider((ref) => SideMenuController());

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
                    const Navbar(),

                    // View
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            AnimatedBuilder(
              animation: SideMenuController.menuController,
              builder: (context, _) => Stack(
                children: [
                  if (SideMenuController.isOpen)
                    Opacity(
                      opacity: SideMenuController.opacity.value,
                      child: GestureDetector(
                        onTap: () => SideMenuController.closeMenu(),
                        child: Container(
                          width: size.width,
                          height: size.height,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                  Transform.translate(
                    offset: Offset(SideMenuController.movement.value, 0),
                    child: const Sidebar(),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
