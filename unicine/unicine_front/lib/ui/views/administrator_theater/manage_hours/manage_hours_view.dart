import 'package:flutter/material.dart';

import 'package:uni_cine/ui/views/manage_view.dart';
import 'package:uni_cine/ui/views/administrator_theater/manage_hours/form_hours.dart';
import 'package:uni_cine/ui/views/administrator_theater/manage_hours/table_hours.dart';

class ManageHoursView extends StatelessWidget {
  const ManageHoursView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ManageView(
      title: 'Detalle Sala',
      formView: FormHours(),
      tableView: TableHours(),
    );
  }
}
