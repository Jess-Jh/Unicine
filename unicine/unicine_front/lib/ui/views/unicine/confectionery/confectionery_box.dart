import 'package:flutter/material.dart';
import 'package:uni_cine/utils/custom_labels.dart';
import 'package:uni_cine/utils/custom_network_image.dart';

class ConfectioneryBox extends StatelessWidget {
  final String name;
  final String price;
  final String img;
  const ConfectioneryBox(
      {super.key, required this.name, required this.price, required this.img});

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
                imageUrl: img,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              name,
              style: CustomLabels.h3,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(height: 5),
            Text(
              r'$ ' + price,
              style: CustomLabels.h3,
            ),
            const SizedBox(height: 10),
            Container(
              width: 210,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                child: Row(
                  children: [
                    MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
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
                    Text('0', style: CustomLabels.h3),
                    const Spacer(),
                    MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
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
            )
          ],
        ),
      ),
    );
  }
}
