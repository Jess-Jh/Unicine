import 'package:flutter/material.dart';
import 'package:uni_cine/controllers/sidemenu_controller.dart';
import 'package:uni_cine/ui/shared/animated_builder_sidebar.dart';
import 'package:uni_cine/ui/shared/custom_app_menu.dart';
import 'package:uni_cine/ui/shared/navbar.dart';

class UnicineLayoutPage extends StatefulWidget {
  final Widget child;

  const UnicineLayoutPage({Key? key, required this.child}) : super(key: key);

  @override
  State<UnicineLayoutPage> createState() => _UnicineLayoutPageState();
}

class _UnicineLayoutPageState extends State<UnicineLayoutPage>
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
      body: size.width > 700
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Navbar(text: 'Iniciar sesión', text2: 'Registrarse'),
                const CustomAppMenu(),
                // const Spacer(),
                Expanded(child: widget.child),

                // const Spacer()
              ],
            )
          : Stack(
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Navbar(text: 'Iniciar sesión', text2: 'Registrarse'),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const Spacer(),
                          Expanded(child: widget.child),

                          // const Spacer()
                        ],
                      ),
                    ),
                  ],
                ),
                if (size.width < 700)
                  AnimatedBuilderSidebar(
                      size: size, sidebar: const CustomAppMenu())
              ],
            ),
    );
  }
}
