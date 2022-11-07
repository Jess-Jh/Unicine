import 'package:flutter/material.dart';

import 'package:uni_cine/ui/views/administrator_theater/manage_room/form_room.dart';
import 'package:uni_cine/ui/views/administrator_theater/manage_room/table_rooms.dart';
import 'package:uni_cine/ui/views/custom_card_view.dart';

class ManageRoomView extends StatelessWidget {
  const ManageRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: CustomCardView(
        title: 'Detalle Sala',
        formView: FormRoom(),
        tableView: TableRooms(),
      ),
    );
  }
}
