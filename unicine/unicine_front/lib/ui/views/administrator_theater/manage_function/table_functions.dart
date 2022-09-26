import 'package:flutter/material.dart';

import 'package:uni_cine/datatables/functions_datasource.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';

class TableFunctions extends StatelessWidget {
  const TableFunctions({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      columnSpacing: 200,
      source: FunctionsDTS(),
      header: const Text(
        'Lista de funciones',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      columns: const [
        DataColumn(label: Text('Película')),
        DataColumn(label: Text('Sala')),
        DataColumn(label: Text('Horario')),
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
