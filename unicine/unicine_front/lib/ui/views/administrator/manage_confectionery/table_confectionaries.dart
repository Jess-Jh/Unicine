import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import 'package:uni_cine/datatables/confectionaries_datasource.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';

class TableConfectionaries extends ConsumerWidget {
  const TableConfectionaries({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(confectioneryProvider);
    final size = MediaQuery.of(context).size;

    return PaginatedDataTable(
      columnSpacing: size.width / 6,
      source:
          ConfectionariesDTS(ctrl.loading ? [] : ctrl.confectioneries, context),
      header: const Text(
        'Lista de productos',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      columns: const [
        DataColumn(label: Text('Id Confitería')),
        DataColumn(label: Text('Nombre')),
        DataColumn(label: Text('Precio')),
        DataColumn(label: Text('Acciones')),
      ],
    );
  }
}
