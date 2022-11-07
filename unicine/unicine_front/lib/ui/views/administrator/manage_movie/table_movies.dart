import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/datatables/movies_datasource.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';

class TableMovies extends ConsumerWidget {
  const TableMovies({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(movieProvider);

    return PaginatedDataTable(
      columnSpacing: 100,
      source: MoviesDTS(ctrl.loading ? [] : ctrl.movies, context),
      header: const Text(
        'Lista de películas',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      columns: const [
        DataColumn(label: Text('Id Película')),
        DataColumn(label: Text('Nombre')),
        DataColumn(label: Text('Género')),
        DataColumn(label: Text('Url imagen')),
        DataColumn(label: Text('Acciones')),
      ],
      // actions: [
      //   CustomOutlinedButton(
      //     onPressed: () {

      //     },
      //     text: 'Eliminar',
      //     width: 200,
      //     height: 6,
      //     fontSize: 12,
      //   ),
      // ],
    );
  }
}
