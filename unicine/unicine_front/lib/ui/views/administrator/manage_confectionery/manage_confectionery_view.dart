import 'package:flutter/material.dart';

import 'package:uni_cine/ui/views/administrator/manage_confectionery/form_confectionary.dart';
import 'package:uni_cine/ui/views/administrator/manage_confectionery/table_confectionaries.dart';
import 'package:uni_cine/ui/views/custom_card_view.dart';

class ManageConfectioneryView extends StatelessWidget {
  const ManageConfectioneryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCardView(
      title: 'Detalle Teatro',
      formView: FormConfectionary(),
      tableView: TableConfectionaries(),
    );
  }
}
