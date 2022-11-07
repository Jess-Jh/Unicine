import 'package:flutter/material.dart';

import 'package:uni_cine/ui/views/administrator/manage_coupon/form_coupons.dart';
import 'package:uni_cine/ui/views/administrator/manage_coupon/table_coupons.dart';
import 'package:uni_cine/ui/views/custom_card_view.dart';

class ManageCouponView extends StatelessWidget {
  const ManageCouponView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: CustomCardView(
        title: 'Detalle Cupón',
        formView: FormCoupons(),
        tableView: TableCoupons(),
      ),
    );
  }
}
