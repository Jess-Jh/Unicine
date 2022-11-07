import 'package:flutter_meedu/meedu.dart';
import 'package:uni_cine/models/administrator/movie.dart';
import 'package:uni_cine/repositories/api/unicine_api.dart';

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
}
