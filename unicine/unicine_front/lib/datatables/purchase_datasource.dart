import 'package:flutter/material.dart';
import 'package:uni_cine/models/unicine/purchase.dart';

class PurchaseDTS extends DataTableSource {
  final List<Purchase> listPurchase;
  final BuildContext context;

  PurchaseDTS(this.listPurchase, this.context);

  @override
  DataRow getRow(int index) {
    final purchase = listPurchase[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(purchase.idCompra.toString())),
        DataCell(Text(purchase.fechaCompra.toString())),
        DataCell(Text(purchase.metodoPago.toString())),
        DataCell(Text(purchase.subtotal.toString())),
        DataCell(Text(purchase.total.toString())),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => listPurchase.length;

  @override
  int get selectedRowCount => 0;
}
