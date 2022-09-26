import 'package:flutter/material.dart';

import 'package:uni_cine/datatables/confectionaries_datasource.dart';
import 'package:uni_cine/ui/shared/custom_outlined_button.dart';

class TableConfectionaries extends StatelessWidget {
  const TableConfectionaries({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      columnSpacing: 200,
      source: ConfectionariesDTS(),
      header: const Text(
        'Lista de productos',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      columns: const [
        DataColumn(label: Text('Nombre')),
        DataColumn(label: Text('Precio')),
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
