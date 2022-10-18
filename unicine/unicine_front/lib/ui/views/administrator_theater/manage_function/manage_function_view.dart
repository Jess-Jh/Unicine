import 'package:flutter/material.dart';

import 'package:uni_cine/ui/views/custom_card_view.dart';
import 'package:uni_cine/ui/views/administrator_theater/manage_function/form_function.dart';
import 'package:uni_cine/ui/views/administrator_theater/manage_function/table_functions.dart';

class ManageFunctionView extends StatelessWidget {
  const ManageFunctionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCardView(
      title: 'Detalle Función',
      formView: FormFunction(),
      tableView: TableFunctions(),
    );
  }
}
