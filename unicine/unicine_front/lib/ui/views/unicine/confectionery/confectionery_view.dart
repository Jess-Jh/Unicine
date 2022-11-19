import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/controllers/administrator/confectionery_controller.dart';
import 'package:uni_cine/router/router.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/ui/shared/appbar/custom_app_menu.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';
import 'package:uni_cine/ui/shared/total_purchase_box.dart';
import 'package:uni_cine/ui/views/unicine/confectionery/list_confectioneries.scroll.dart';
import 'package:uni_cine/utils/custom_colors.dart';
import 'package:uni_cine/utils/custom_labels.dart';

class ConfectioneryView extends ConsumerWidget {
  ConfectioneryView({super.key}) {
    confectioneryProvider.read.getConfectioneries();
  }

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(confectioneryProvider);

    int confectioneries = ctrl.confectioneries.length;
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(width: 20),
              Text('Confitería', style: CustomLabels.h1),
              const Spacer(),
              _iconShopping(ctrl),
              const SizedBox(width: 15),
              Text(r'$ ' + ctrl.priceTotalBuy.toString(),
                  style: CustomLabels.h3),
              const SizedBox(width: 100)
            ],
          ),
          const SizedBox(height: 40),
          ListConfectioneriesScroll(
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
                  text: 'Realizar Pago',
                  onPressed: () => navigateTo(Flurorouter.purchaseDetailRoute),
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
                  text: 'Realizar Pago',
                  onPressed: () => navigateTo(Flurorouter.purchaseDetailRoute),
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

  _iconShopping(ConfectioneryController ctrl) {
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
            ctrl.cantBuyConfectionery.toString(),
            style: TextStyle(fontSize: 8, color: CustomColors.themeWhite),
          ),
        ),
      ],
    );
  }
}
