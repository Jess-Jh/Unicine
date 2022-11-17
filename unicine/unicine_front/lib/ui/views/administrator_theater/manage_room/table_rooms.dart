import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/datatables/rooms_datasource.dart';
import 'package:uni_cine/ui/layouts/administrator_theater_layout.dart';

class TableRooms extends ConsumerWidget {
  const TableRooms({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(roomManageProvider);
    final size = MediaQuery.of(context).size;

    return PaginatedDataTable(
      columnSpacing: size.width / 7,
      source: RoomsDTS(ctrl.loading ? [] : ctrl.rooms, context),
      header: const Text(
        'Lista de salas',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      columns: const [
        DataColumn(label: Text('Id Sala')),
        DataColumn(label: Text('Nombre')),
        DataColumn(label: Text('Distribución de sillas')),
        DataColumn(label: Text('Acciones')),
      ],
    );
  }
}
