import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/models/administrator/confectionery.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/utils/custom_labels.dart';
import 'package:uni_cine/utils/custom_network_image.dart';

class ConfectioneryBox extends StatelessWidget {
  final int index;
  final Confectionery confectionery;
  const ConfectioneryBox({
    super.key,
    required this.index,
    required this.confectionery,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 180,
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CustomNetworkImage(
                height: 190,
                width: 200,
                fit: BoxFit.cover,
                placeholder:
                    Image.asset('assets/images/placeholder_confectionary.jpg'),
                imageUrl: confectionery.imagen ?? '',
              ),
            ),
            const SizedBox(height: 5),
            Text(
              confectionery.nombre ?? '',
              style: CustomLabels.h3,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(height: 5),
            Text(
              r'$ ' + confectionery.precio.toString(),
              style: CustomLabels.h3,
            ),
            const SizedBox(height: 10),
            Consumer(builder: (context, ref, _) {
              final ctrl = ref.watch(confectioneryProvider);
              return Container(
                width: 210,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 10.0),
                  child: Row(
                    children: [
                      MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => ctrl.getLessBuy(index),
                            child: Container(
                              alignment: Alignment.center,
                              width: 35,
                              child: Text(
                                '-',
                                style: CustomLabels.h3,
                              ),
                            ),
                          )),
                      const Spacer(),
                      Text(
                        '${confectionery.cant ?? 0}',
                        style: CustomLabels.h3,
                      ),
                      const Spacer(),
                      MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => ctrl.getMoreBuy(index),
                            child: Container(
                              alignment: Alignment.center,
                              width: 35,
                              child: Text(
                                '+',
                                style: CustomLabels.h3,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
