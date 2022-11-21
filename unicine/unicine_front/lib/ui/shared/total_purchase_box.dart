import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/utils/custom_colors.dart';

class TotalPurchaseBox extends ConsumerWidget {
  final double? width;
  final double? height;
  final bool? showText;
  final String? text;
  final Color? colorText;
  const TotalPurchaseBox({
    super.key,
    this.width,
    this.height,
    this.showText = true,
    this.colorText,
    this.text,
  });

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(movieProvider);
    return SizedBox(
      width: width ?? 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showText!)
            const Text(
              '   Total Compra',
              textAlign: TextAlign.left,
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
              children: [
                Text(
                  text ?? 'Compra',
                  style: TextStyle(color: colorText ?? Colors.white),
                ),
                const Spacer(),
                Text(
                  r'$ ' + ctrl.totalPurchase.toString(),
                  style: TextStyle(color: colorText ?? Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
