import 'package:flutter/material.dart';
import 'package:uni_cine/ui/views/custom_card_view.dart';
import 'package:uni_cine/ui/views/unicine/purchase_detail/form_purchase.dart';

class PurchaseDetailView extends StatelessWidget {
  const PurchaseDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCardView(
      title: 'Detalle Compra',
      formView: FormPurchase(),
    );
  }
}
