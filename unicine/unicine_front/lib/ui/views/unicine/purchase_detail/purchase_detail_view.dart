import 'package:flutter/material.dart';
import 'package:uni_cine/ui/views/custom_card_view.dart';
import 'package:uni_cine/ui/views/unicine/purchase_detail/form_purchase.dart';

class PurchaseDetailView extends StatelessWidget {
  // Selección de cupones
  List<String> coupons = [
    'Cupón 1',
    'Cupón 2',
    'Cupón 3',
  ];

  // Filtro de cupones
  String? selectCoupon = 'Cupón 1';

  PurchaseDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45.0),
      child: CustomCardView(
        title: 'Detalle Compra',
        sizeLetter: 30,
        formView: FormPurchase(coupons: coupons, selectCoupon: selectCoupon),
      ),
    );
  }
}
