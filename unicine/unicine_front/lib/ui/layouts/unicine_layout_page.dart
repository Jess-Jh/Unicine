import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';

import 'package:uni_cine/controllers/sidemenu_controller.dart';
import 'package:uni_cine/controllers/unicine/client_controller.dart';
import 'package:uni_cine/controllers/unicine/function_Controller.dart';
import 'package:uni_cine/services/local_storage.dart';
import 'package:uni_cine/ui/shared/appbar/animated_builder_sidebar.dart';
import 'package:uni_cine/ui/shared/appbar/custom_app_menu.dart';
import 'package:uni_cine/ui/shared/appbar/navbar.dart';

final functionProvider = SimpleProvider((ref) => FunctionController());
final clientProvider = SimpleProvider((ref) => ClientController());

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
    final token = LocalStorage.prefs.getString('token');
    return Scaffold(
      backgroundColor: const Color(0xffEDF1F2),
      body: size.width >= 720
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (token == null)
                  const Navbar(text: 'Iniciar sesión', text2: 'Registrarse'),
                if (token != null) const Navbar(text: 'Cerrar Sesión'),

                const CustomAppMenu(),
                // const Spacer(),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: widget.child,
                    ),
                  ),
                ),

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
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: widget.child,
                              ),
                            ),
                          ),

                          // const Spacer()
                        ],
                      ),
                    ),
                  ],
                ),
                if (size.width < 720)
                  AnimatedBuilderSidebar(
                    size: size,
                    sidebar: const CustomAppMenu(),
                  )
              ],
            ),
    );
  }
}
