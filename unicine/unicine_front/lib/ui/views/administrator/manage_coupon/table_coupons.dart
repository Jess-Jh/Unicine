import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import 'package:uni_cine/datatables/coupons_datasource.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';

class TableCoupons extends ConsumerWidget {
  const TableCoupons({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(couponProvider);
    final size = MediaQuery.of(context).size;

    return PaginatedDataTable(
      columnSpacing: size.width / 10,
      source: CouponsDTS(ctrl.loading ? [] : ctrl.coupons, context),
      header: const Text(
        'Lista de cupones',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      columns: const [
        DataColumn(label: Text('Id Cupón')),
        DataColumn(label: Text('Valor de descuento')),
        DataColumn(label: Text('Descripción')),
        DataColumn(label: Text('Fecha Vencimiento')),
        DataColumn(label: Text('Acciones')),
      ],
    );
  }
}
