import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:uni_cine/controllers/administrator_theater/distribution_chairs_controller.dart';
import 'package:uni_cine/controllers/administrator_theater/hours_controller.dart';
import 'package:uni_cine/controllers/administrator_theater/room_manage_controller.dart';

import 'package:uni_cine/controllers/sidemenu_controller.dart';
import 'package:uni_cine/ui/shared/appbar/animated_builder_sidebar.dart';
import 'package:uni_cine/ui/shared/appbar/navbar.dart';
import 'package:uni_cine/ui/shared/appbar/sidebar_administrator_theater.dart';

final hourProvider = SimpleProvider((ref) => HoursController());
final roomManageProvider = SimpleProvider((ref) => RoomManageController());
final distributionChairsProvider =
    SimpleProvider((ref) => DistributionChairsController());

class AdministratorTheaterLayout extends StatefulWidget {
  final Widget child;
  const AdministratorTheaterLayout({super.key, required this.child});

  @override
  State<AdministratorTheaterLayout> createState() =>
      _AdministratorTheaterLayoutState();
}

class _AdministratorTheaterLayoutState extends State<AdministratorTheaterLayout>
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
              if (size.width >= 720) const SidebarAdministratorTheater(),
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
          if (size.width < 720)
            AnimatedBuilderSidebar(
              size: size,
              sidebar: const SidebarAdministratorTheater(),
            )
        ],
      ),
    );
  }
}
