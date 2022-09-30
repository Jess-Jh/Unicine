import 'package:flutter/material.dart';
import 'package:uni_cine/controllers/sidemenu_controller.dart';

class AnimatedBuilderSidebar extends StatelessWidget {
  final Widget sidebar;
  const AnimatedBuilderSidebar({
    Key? key,
    required this.size,
    required this.sidebar,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
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
            child: sidebar,
          )
        ],
      ),
    );
  }
}
