import 'package:flutter/material.dart';
import 'package:uni_cine/utils/custom_colors.dart';

class TotalPurchaseBox extends StatelessWidget {
  final double? width;
  final double? height;
  const TotalPurchaseBox({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            textAlign: TextAlign.left,
            '   Total Compra',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: width ?? 250,
            height: height ?? 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColors.principal,
            ),
            child: Row(
              children: const [
                Text(
                  'Compra',
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(),
                Text(
                  r'$00.000',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
