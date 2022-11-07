import 'package:flutter/material.dart';

import 'package:uni_cine/ui/views/custom_card_view.dart';
import 'package:uni_cine/ui/views/administrator_theater/manage_hours/form_hours.dart';
import 'package:uni_cine/ui/views/administrator_theater/manage_hours/table_hours.dart';

class ManageHoursView extends StatelessWidget {
  const ManageHoursView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: CustomCardView(
        title: 'Detalle Sala',
        formView: FormHours(),
        tableView: TableHours(),
      ),
    );
  }
}
