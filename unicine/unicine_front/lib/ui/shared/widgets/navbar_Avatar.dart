import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:html' as html;

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        'https://www.webespacio.com/wp-content/uploads/2012/01/foto-perfil.jpg';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      imageUrl,
      (int _) {
        final html.Element htmlElement = html.ImageElement()
          ..style.width = '100%'
          ..style.height = '100%'
          ..src = imageUrl;
        return htmlElement;
      },
    );
    return ClipOval(
      child: SizedBox(
        width: 30,
        height: 30,
        child: HtmlElementView(
          viewType: imageUrl,
        ),
      ),
    );

    // return SizedBox(
    //   width: 30,
    //   height: 30,
    //   child: Image.network(),
    // );
  }
}
