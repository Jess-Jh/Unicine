import 'package:flutter/material.dart';
import 'package:uni_cine/ui/views/custom_card_view.dart';
import 'package:uni_cine/ui/views/unicine/purchase_detail/form_purchase.dart';

class PurchaseDetailView extends StatelessWidget {
  // Selección de cupones
  List<String> coupons = [
    'Descuento Registro 15%',
    'Descuento compra 10%',
    'Adquisición membresía 10%',
  ];

  // Filtro de cupones
  String? selectCoupon = 'Descuento Registro 15%';

  PurchaseDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    // return PurchaseDetailCard(coupons: coupons, selectCoupon: selectCoupon);
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
