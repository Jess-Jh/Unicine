import 'package:flutter/material.dart';

import 'package:uni_cine/datatables/coupons_datasource.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';

class TableCoupons extends StatelessWidget {
  const TableCoupons({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      columnSpacing: 200,
      source: CouponsDTS(),
      header: const Text(
        'Lista de cupones',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      columns: const [
        DataColumn(label: Text('Valor de descuento')),
        DataColumn(label: Text('Descripción')),
      ],
      actions: [
        CustomOutlinedButton(
          onPressed: () {},
          text: 'Eliminar',
          width: 200,
          height: 6,
          fontSize: 12,
        ),
      ],
    );
  }
}
