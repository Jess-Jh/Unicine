import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/ui/layouts/administrator_theater_layout.dart';

import 'package:uni_cine/ui/views/custom_card_view.dart';
import 'package:uni_cine/ui/views/administrator_theater/manage_hours/form_hours.dart';
import 'package:uni_cine/ui/views/administrator_theater/manage_hours/table_hours.dart';

class ManageHoursView extends ConsumerWidget {
  ManageHoursView({super.key}) {
    hourProvider.read.getHours();
  }

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(hourProvider);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomCardView(
        isEdit: ctrl.isEdit,
        title: 'Detalle Horario',
        formView: const FormHours(),
        tableView: const TableHours(),
      ),
    );
  }
}
