import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uni_cine/ui/views/unicine/confectionery/confectionery_box.dart';

class ListConfectioneriesScroll extends StatelessWidget {
  final int confectioneries;
  final String name;
  final String price;
  final String img;
  const ListConfectioneriesScroll(
      {super.key,
      required this.confectioneries,
      required this.price,
      required this.img,
      required this.name});

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
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: confectioneries,
          itemBuilder: (_, c) => ConfectioneryBox(
            img: img,
            name: name,
            price: price,
          ),
        ),
      ),
    );
  }
}
