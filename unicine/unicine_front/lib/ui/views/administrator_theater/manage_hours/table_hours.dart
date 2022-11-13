import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/datatables/hours_datasource.dart';
import 'package:uni_cine/ui/layouts/administrator_theater_layout.dart';

class TableHours extends ConsumerWidget {
  const TableHours({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(hourProvider);
    final size = MediaQuery.of(context).size;

    return PaginatedDataTable(
      columnSpacing: size.width / 5.5,
      source: HoursDTS(ctrl.loading ? [] : ctrl.hours, context),
      header: const Text(
        'Lista de horarios',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      columns: const [
        DataColumn(label: Text('Id Horario')),
        DataColumn(label: Text('Fecha')),
        DataColumn(label: Text('Hora')),
        DataColumn(label: Text('Acciones')),
      ],
    );
  }
}
