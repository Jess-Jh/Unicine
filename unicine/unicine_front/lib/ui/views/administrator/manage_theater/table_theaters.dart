import 'package:flutter/material.dart';
import 'package:uni_cine/datatables/theaters_datasource.dart';
import 'package:uni_cine/ui/shared/custom_outlined_button.dart';

class TableTheaters extends StatelessWidget {
  const TableTheaters({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      columnSpacing: 200,
      source: TheatersDTS(),
      header: const Text(
        'Lista de teatros',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      columns: const [
        DataColumn(label: Text('Nombre')),
        DataColumn(label: Text('Dirección')),
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
