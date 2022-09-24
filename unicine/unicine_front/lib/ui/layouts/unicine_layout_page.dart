import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/custom_app_menu.dart';

class UnicineLayoutPage extends StatelessWidget {
  final Widget child;

  const UnicineLayoutPage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const CustomAppMenu(),
            // const Spacer(),
            Expanded(child: child),

            // const Spacer()
          ],
        ),
      ),
    );
  }
}
