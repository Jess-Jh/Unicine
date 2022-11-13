import 'package:flutter/material.dart';
import 'package:uni_cine/models/administrator_theater/hour.dart';
import 'package:uni_cine/ui/layouts/administrator_theater_layout.dart';
import 'package:uni_cine/ui/views/administrator_theater/manage_hours/form_hours.dart';
import 'package:uni_cine/utils/util.dart';

class HoursDTS extends DataTableSource {
  final List<Hour> hours;
  final BuildContext context;

  HoursDTS(this.hours, this.context);

  @override
  DataRow getRow(int index) {
    final hour = hours[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(hour.idHorario.toString())),
        DataCell(Text(getStringDateFromDateTime(hour.fecha!))),
        DataCell(Text(hour.hora!)),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.edit_outlined,
                ),
                onPressed: () {
                  FormHours(id: hour.idHorario);
                  hourProvider.read.editSelectHour(hour);
                  hourProvider.read.isUpdateHour();
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.red.withOpacity(0.8),
                ),
                onPressed: () {
                  final dialog = showMessageAlert(
                    context,
                    '¿Está seguro de eliminar?',
                    '${hour.idHorario}',
                    hour.idHorario!,
                  );

                  showDialog(context: context, builder: (_) => dialog);
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  AlertDialog showMessageAlert(
      BuildContext context, String title, String content, int id) {
    return AlertDialog(
      alignment: Alignment.center,
      icon: Icon(
        Icons.error_outline,
        color: Colors.red.withOpacity(0.8),
        size: 80,
      ),
      title: Text(title),
      content: Text('¿Borrar definitivamente $content?'),
      actions: [
        TextButton(
          child: const Text('No'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Si, borrar'),
          onPressed: () async {
            await hourProvider.read.deleteHour(context, id).then((value) {
              Navigator.of(context).pop();
            });
          },
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => hours.length;

  @override
  int get selectedRowCount => 0;
}
