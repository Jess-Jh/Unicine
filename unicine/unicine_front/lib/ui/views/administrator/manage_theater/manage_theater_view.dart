import 'package:flutter/material.dart';

import 'package:uni_cine/ui/views/administrator/manage_theater/form_theaters.dart';
import 'package:uni_cine/ui/views/administrator/manage_theater/table_theaters.dart';
import 'package:uni_cine/ui/views/custom_card_view.dart';

class ManageTheaterView extends StatelessWidget {
  const ManageTheaterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCardView(
      title: 'Detalle Teatro',
      formView: FormTheaters(),
      tableView: TableTheaters(),
    );
  }
}
