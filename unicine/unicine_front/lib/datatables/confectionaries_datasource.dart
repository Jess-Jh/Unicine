import 'package:flutter/material.dart';
import 'package:uni_cine/models/administrator/confectionery.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/ui/views/administrator/manage_confectionery/form_confectionary.dart';

class ConfectionariesDTS extends DataTableSource {
  final List<Confectionery> confectioneries;
  final BuildContext context;

  ConfectionariesDTS(this.confectioneries, this.context);

  @override
  DataRow getRow(int index) {
    final confectionery = confectioneries[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(confectionery.idConfiteria.toString())),
        DataCell(Text(confectionery.nombre!)),
        DataCell(Text(confectionery.precio.toString())),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.edit_outlined,
                ),
                onPressed: () {
                  FormConfectionary(id: confectionery.idConfiteria);
                  confectioneryProvider.read
                      .editSelectConfectionery(confectionery);
                  confectioneryProvider.read.isUpdateConfectionery();
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.red.withOpacity(0.8),
                ),
                onPressed: () {
                  final dialog = showMessageAlert(
                    context,
                    '¿Está seguro de eliminar?',
                    '${confectionery.nombre}',
                    confectionery.idConfiteria!,
                  );

                  showDialog(context: context, builder: (_) => dialog);
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  AlertDialog showMessageAlert(
      BuildContext context, String title, String content, int id) {
    return AlertDialog(
      alignment: Alignment.center,
      icon: Icon(
        Icons.error_outline,
        color: Colors.red.withOpacity(0.8),
        size: 80,
      ),
      title: Text(title),
      content: Text('¿Borrar definitivamente $content?'),
      actions: [
        TextButton(
          child: const Text('No'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Si, borrar'),
          onPressed: () async {
            await confectioneryProvider.read
                .deleteConfectionery(context, id)
                .then((value) {
              Navigator.of(context).pop();
            });
          },
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => confectioneries.length;

  @override
  int get selectedRowCount => 0;
}
