import 'package:flutter/material.dart';
import 'package:uni_cine/datatables/rooms_datasource.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';

class TableRooms extends StatelessWidget {
  const TableRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      columnSpacing: 200,
      source: RoomsDTS(),
      header: const Text(
        'Lista de salas',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      columns: const [
        DataColumn(label: Text('Nombre')),
        DataColumn(label: Text('Distribución de sillas')),
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
