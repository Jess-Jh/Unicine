import 'package:flutter/material.dart';
import 'package:uni_cine/datatables/movies_datasource.dart';
import 'package:uni_cine/ui/shared/buttons/custom_outlined_button.dart';

class TableMovies extends StatelessWidget {
  const TableMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      columnSpacing: 100,
      source: MoviesDTS(),
      header: const Text(
        'Lista de películas',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      columns: const [
        DataColumn(label: Text('Nombre')),
        DataColumn(label: Text('Género')),
        DataColumn(label: Text('Estado')),
        DataColumn(label: Text('Url imagen')),
      ],
      actions: [
        CustomOutlinedButton(
          onPressed: () {},
          text: 'Eliminar',
          width: 200,
          height: 6,
          fontSize: 12,
        ),
      ],
    );
  }
}
