import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:uni_cine/datatables/movies_datasource.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';

class TableMovies extends ConsumerWidget {
  const TableMovies({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final ctrl = ref.watch(movieProvider);
    final size = MediaQuery.of(context).size;

    return PaginatedDataTable(
      columnSpacing: size.width / 8,
      source: MoviesDTS(ctrl.loading ? [] : ctrl.movies, context),
      header: const Text(
        'Lista de películas',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      columns: const [
        DataColumn(label: Text('Id Película')),
        DataColumn(label: Text('Nombre')),
        DataColumn(label: Text('Género')),
        DataColumn(label: Text('Estado')),
        DataColumn(label: Text('Acciones')),
      ],
    );
  }
}
