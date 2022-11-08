import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:uni_cine/models/administrator/movie.dart';
import 'package:uni_cine/repositories/api/unicine_api.dart';
import 'package:uni_cine/utils/util.dart';
import 'package:uni_cine/widgets/dialogs.dart';

class MovieController extends SimpleNotifier {
  List<Movie> movies = [];
  bool loading = true;

  // Inputs
  String nombre = '';
  String urlImagen = '';
  String trailer = '';
  String genero = '';
  String reparto = '';
  String estado = '';
  String sinopsis = '';

  bool validateForm(formMovieKey) {
    if (formMovieKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void getMovies() async {
    final res = await UnicineApi.httpGet('/lista-peliculas');
    for (final i in res) {
      movies.add(Movie.fromMap(i));
    }
    loading = false;
    notify();
  }

  Future<void> newMovie(BuildContext context) async {
    Movie movie = Movie(
      idPelicula: 0,
      nombre: nombre,
      imagen: urlImagen,
      trailer: trailer,
      genero: genero,
      sinopsis: sinopsis,
      reparto: reparto,
      estadoPelicula: estado,
    );

    try {
      await UnicineApi.post('/crear-pelicula', movie.toJson()).then((json) {
        final newMovie = Movie.fromMap(json);
        movies.add(newMovie);
        loading = false;
        Dialogs.showSnackbarTop(
          context,
          'La película ha quedado guardada con éxito',
          isError: false,
        );

        notify();
      }).catchError((e) => throw e);
    } catch (e) {
      Dialogs.showSnackbarTop(
        context,
        'Error en $e',
        isError: true,
      );
      log(runtimeType, 'Error en newMovie MovieController $e');
    }
  }
}
