import 'package:flutter/material.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';

import 'package:uni_cine/ui/views/administrator/manage_confectionery/form_confectionary.dart';
import 'package:uni_cine/ui/views/administrator/manage_confectionery/table_confectionaries.dart';
import 'package:uni_cine/ui/views/custom_card_view.dart';

class ManageConfectioneryView extends StatelessWidget {
  const ManageConfectioneryView({super.key});

  @override
  Widget build(BuildContext context) {
    confectioneryProvider.read.getConfectioneries();
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: CustomCardView(
        title: 'Detalle Confitería',
        formView: FormConfectionary(),
        tableView: TableConfectionaries(),
      ),
    );
  }
}
