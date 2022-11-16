import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/ui/layouts/administrator_theater_layout.dart';

import 'package:uni_cine/ui/views/administrator_theater/manage_room/form_room.dart';
import 'package:uni_cine/ui/views/administrator_theater/manage_room/table_rooms.dart';
import 'package:uni_cine/ui/views/custom_card_view.dart';

class ManageRoomView extends ConsumerWidget {
  ManageRoomView({super.key}) {
    roomManageProvider.read.getRooms();
  }

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(roomManageProvider);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomCardView(
        isEdit: ctrl.isEdit,
        title: 'Detalle Sala',
        formView: const FormRoom(),
        tableView: const TableRooms(),
      ),
    );
  }
}
