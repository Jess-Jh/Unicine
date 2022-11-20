import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/datatables/purchase_datasource.dart';
import 'package:uni_cine/ui/layouts/unicine_layout_page.dart';

class TablePurchaseClient extends ConsumerWidget {
  const TablePurchaseClient({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(clientProvider);
    final size = MediaQuery.of(context).size;

    return PaginatedDataTable(
      columnSpacing: size.width / 7,
      source: PurchaseDTS(ctrl.loading ? [] : ctrl.listPurchase, context),
      header: const Text(
        'Lista compras',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      columns: const [
        DataColumn(label: Text('Id Compra')),
        DataColumn(label: Text('fecha Compra')),
        DataColumn(label: Text('Método de pago')),
        DataColumn(label: Text('Subtotal')),
        DataColumn(label: Text('Total')),
      ],
    );
  }
}
