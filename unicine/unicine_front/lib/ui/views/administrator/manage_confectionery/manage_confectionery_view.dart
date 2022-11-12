import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';

import 'package:uni_cine/ui/views/administrator/manage_confectionery/form_confectionary.dart';
import 'package:uni_cine/ui/views/administrator/manage_confectionery/table_confectionaries.dart';
import 'package:uni_cine/ui/views/custom_card_view.dart';

class ManageConfectioneryView extends ConsumerWidget {
  ManageConfectioneryView({super.key}) {
    confectioneryProvider.read.getConfectioneries();
  }

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(confectioneryProvider);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomCardView(
        isEdit: ctrl.isEdit,
        title: 'Detalle Confitería',
        formView: const FormConfectionary(),
        tableView: const TableConfectionaries(),
      ),
    );
  }
}
