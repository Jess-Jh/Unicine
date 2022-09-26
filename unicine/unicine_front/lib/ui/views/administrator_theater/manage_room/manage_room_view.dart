import 'package:flutter/material.dart';

import 'package:uni_cine/ui/views/administrator_theater/manage_room/form_room.dart';
import 'package:uni_cine/ui/views/administrator_theater/manage_room/table_rooms.dart';
import 'package:uni_cine/ui/views/manage_view.dart';

class ManageRoomView extends StatelessWidget {
  const ManageRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ManageView(
      title: 'Detalle Sala',
      formView: FormRoom(),
      tableView: TableRooms(),
    );
  }
}
