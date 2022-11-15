import 'package:flutter/material.dart';
import 'package:uni_cine/models/administrator_theater/room.dart';
import 'package:uni_cine/ui/layouts/administrator_theater_layout.dart';
import 'package:uni_cine/ui/views/administrator_theater/manage_room/form_room.dart';

class RoomsDTS extends DataTableSource {
  final List<Room> rooms;
  final BuildContext context;

  RoomsDTS(this.rooms, this.context);

  @override
  DataRow getRow(int index) {
    final room = rooms[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(room.idSala.toString())),
        DataCell(Text(room.nombre!)),
        DataCell(Text('Cell #2 index: $index')),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.edit_outlined,
                ),
                onPressed: () {
                  FormRoom(id: room.idSala);
                  roomManageProvider.read.editSelectRoom(room);
                  roomManageProvider.read.isUpdateRoom();
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
                    '${room.nombre}',
                    room.idSala!,
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
            await roomManageProvider.read.deleteRoom(context, id).then((value) {
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
  int get rowCount => rooms.length;

  @override
  int get selectedRowCount => 0;
}
