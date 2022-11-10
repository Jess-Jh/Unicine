import 'package:flutter/material.dart';
import 'package:uni_cine/models/administrator/movie.dart';
import 'package:uni_cine/ui/layouts/administrator_layout_page.dart';
import 'package:uni_cine/ui/views/administrator/manage_movie/form_movies.dart';

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
                FormMovies(id: movie.idPelicula);
                movieProvider.read.editSelectMovie(movie);
                movieProvider.read.isUpdateMovie();
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
                  '${movie.nombre}',
                  movie.idPelicula!,
                );

                showDialog(context: context, builder: (_) => dialog);
              },
            )
          ],
        )),
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
            await movieProvider.read.deleteMovie(context, id).then((value) {
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
  int get rowCount => movies.length;

  @override
  int get selectedRowCount => 0;
}
