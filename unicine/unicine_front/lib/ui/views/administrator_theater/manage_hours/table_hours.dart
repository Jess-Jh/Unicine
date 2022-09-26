import 'package:flutter/material.dart';
import 'package:uni_cine/datatables/hours_datasource.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';

class TableHours extends StatelessWidget {
  const TableHours({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      columnSpacing: 200,
      source: HoursDTS(),
      header: const Text(
        'Lista de horarios',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      columns: const [
        DataColumn(label: Text('Fecha')),
        DataColumn(label: Text('Hora')),
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
