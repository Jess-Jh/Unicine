import 'package:flutter/material.dart';
import 'package:uni_cine/utils/custom_labels.dart';

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
              child: FadeInImage.assetNetwork(
                placeholder: img,
                image: img,
                imageErrorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.error,
                  size: 64,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              name,
              style: CustomLabels.h3,
            ),
            const SizedBox(height: 5),
            Text(
              price,
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
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                child: Row(
                  children: [
                    Text('-', style: CustomLabels.h3),
                    const Spacer(),
                    Text('0', style: CustomLabels.h3),
                    const Spacer(),
                    Text('+', style: CustomLabels.h3),
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
