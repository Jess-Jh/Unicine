import 'package:flutter/material.dart';
import 'package:uni_cine/models/administrator/movie.dart';
import 'package:uni_cine/widgets/dialogs.dart';

class MoviesDTS extends DataTableSource {
  final List<Movie> movies;
  final BuildContext context;

  MoviesDTS(this.movies, this.context);

  @override
  DataRow getRow(int index) {
    final movie = movies[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(movie.idPelicula.toString())),
        DataCell(Text(movie.nombre!)),
        DataCell(Text(movie.genero!)),
        DataCell(Text(movie.estadoPelicula!)),
        DataCell(Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.edit_outlined,
              ),
              onPressed: () {
                print('Editanto ${movie.idPelicula}');
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete_outline,
                color: Colors.red.withOpacity(0.8),
              ),
              onPressed: () {
                final dialog = showMessageAlert(
                    context, '¿Está seguro de eliminarla?', '${movie.nombre}');

                showDialog(context: context, builder: (_) => dialog);
              },
            )
          ],
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => movies.length;

  @override
  int get selectedRowCount => 0;
}
