import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/ui/views/unicine/confectionery/confectionery_box.dart';

class ListConfectioneriesScroll extends StatelessWidget {
  final int confectioneries;
  final String name;
  final String price;
  final String img;
  const ListConfectioneriesScroll({
    super.key,
    required this.confectioneries,
    required this.price,
    required this.img,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: Consumer(builder: (context, ref, _) {
          final ctrl = ref.watch(confectioneryProvider);

          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: ctrl.confectioneries.length,
            itemBuilder: (_, c) => ConfectioneryBox(
              img: ctrl.confectioneries[c].imagen ?? '',
              name: ctrl.confectioneries[c].nombre ?? '',
              price: ctrl.confectioneries[c].precio.toString(),
            ),
          );
        }),
      ),
    );
  }
}
