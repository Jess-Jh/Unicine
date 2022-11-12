import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';

import 'package:uni_cine/ui/views/administrator/manage_coupon/form_coupons.dart';
import 'package:uni_cine/ui/views/administrator/manage_coupon/table_coupons.dart';
import 'package:uni_cine/ui/views/custom_card_view.dart';

class ManageCouponView extends ConsumerWidget {
  ManageCouponView({super.key}) {
    couponProvider.read.getCoupons();
  }

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(couponProvider);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomCardView(
        isEdit: ctrl.isEdit,
        title: 'Detalle Cupón',
        formView: const FormCoupons(),
        tableView: const TableCoupons(),
      ),
    );
  }
}
