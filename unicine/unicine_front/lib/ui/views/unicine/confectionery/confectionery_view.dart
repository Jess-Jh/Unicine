import 'package:flutter/material.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/shared/total_purchase_box.dart';
import 'package:uni_cine/ui/views/unicine/confectionery/list_confectioneries.scroll.dart';
import 'package:uni_cine/utils/custom_colors.dart';
import 'package:uni_cine/utils/custom_labels.dart';

class ConfectioneryView extends StatelessWidget {
  const ConfectioneryView({super.key});

  @override
  Widget build(BuildContext context) {
    const int confectioneries = 30;
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Confitería', style: CustomLabels.h1),
              const Spacer(),
              _iconShopping(),
              const SizedBox(width: 15),
              Text(r'$ 0.000', style: CustomLabels.h3),
              const SizedBox(width: 100)
            ],
          ),
          const SizedBox(height: 40),
          const ListConfectioneriesScroll(
            confectioneries: confectioneries,
            name: 'Nombre confitería',
            price: r'$ 00.0000',
            img: 'assets/images/placeholder_confectionary.jpg',
          ),
          const SizedBox(height: 40),
          if (size.width > 850)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomOutlinedButton(
                  width: size.width / 3.3,
                  text: '+ Agregar Confitería',
                  onPressed: () {},
                ),
                SizedBox(width: size.width / 6),
                TotalPurchaseBox(
                  height: 40,
                  width: size.width / 6,
                ),
              ],
            ),
          if (size.width <= 850)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomOutlinedButton(
                  width: size.width / 3.3,
                  text: '+ Agregar Confitería',
                  onPressed: () {},
                ),
                const SizedBox(height: 15),
                TotalPurchaseBox(
                  height: 40,
                  width: size.width / 6,
                ),
              ],
            )
        ],
      ),
    );
  }

  _iconShopping() {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        const Icon(
          Icons.shopping_cart_outlined,
          size: 30,
        ),
        Container(
          alignment: Alignment.center,
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: CustomColors.principal,
            shape: BoxShape.circle,
          ),
          child: Text(
            '0',
            style: TextStyle(fontSize: 8, color: CustomColors.themeWhite),
          ),
        ),
      ],
    );
  }
}
