import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:uni_cine/models/administrator/movie.dart';
import 'package:uni_cine/models/administrator/theater.dart';
import 'package:uni_cine/models/administrator_theater/distribution_chairs.dart';
import 'package:uni_cine/models/administrator_theater/hour.dart';
import 'package:uni_cine/models/unicine/function_room.dart';
import 'package:uni_cine/repositories/api/unicine_api.dart';
import 'package:uni_cine/ui/shared/type_init_chairs.dart';
import 'package:uni_cine/utils/util.dart';
import 'package:uni_cine/widgets/dialogs.dart';

class MovieController extends SimpleNotifier {
  final GlobalKey<FormState> formMovieKey = GlobalKey<FormState>();
  List<Movie> movies = [];
  List<FunctionRoom> functionsMovie = [];
  Movie? movieFunction;

  Movie? editMovie;
  bool loading = true;
  bool isEdit = false;
  bool notSelected = false;

  // Inputs
  String nombre = '';
  String urlImagen = '';
  String trailer = '';
  String genero = '';
  String reparto = '';
  String estado = '';
  String sinopsis = '';

  // Dates function
  Theater? theater;
  List<Hour> functionsDates = [];
  List<dynamic> chairs = [];
  DistributionChairs? distributionChairs;

  bool validateForm(formMovieKey) {
    if (formMovieKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void editSelectMovie(Movie movie) {
    editMovie = movie;
    estado = editMovie!.estadoPelicula!;
    notify();
    Timer(const Duration(milliseconds: 200),
        () => formMovieKey.currentState?.reset());
  }

  void _cleanInputs() {
    if (loading == false) {
      editMovie = null;
      estado = '';
      notify();
      Timer(const Duration(milliseconds: 200),
          () => formMovieKey.currentState?.reset());
    }
  }

  void getMovies() async {
    var res = await UnicineApi.httpGet('/lista-peliculas');

    for (final i in res['Peliculas']) {
      movies.add(Movie.fromMap(i));
      movies.toList();
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
        final newMovie = Movie.fromMap(json['pelicula']);
        movies.add(newMovie);
        loading = false;
        Dialogs.showSnackbarTop(
          context,
          json['mensaje'],
          isError: false,
        );
        _cleanInputs();
        notify();
      }).catchError((e) => throw e);
    } catch (e) {
      Dialogs.showSnackbarTop(
        context,
        e.toString(),
        isError: true,
      );
      log(runtimeType, 'Error en newMovie MovieController $e');
    }
  }

  Future<void> updateMovie(BuildContext context) async {
    log(runtimeType, estado);
    try {
      if (editMovie == null && editMovie!.idPelicula == null) return;
      isUpdateMovie();
      for (int i = 0; i < movies.length; i++) {
        if (movies[i].idPelicula == editMovie!.idPelicula) {
          editMovie = Movie(
            idPelicula: editMovie?.idPelicula,
            nombre: nombre == '' ? editMovie?.nombre : nombre,
            imagen: urlImagen == '' ? editMovie?.imagen : urlImagen,
            trailer: trailer == '' ? editMovie?.trailer : trailer,
            genero: genero == '' ? editMovie?.genero : genero,
            sinopsis: sinopsis == '' ? editMovie?.sinopsis : sinopsis,
            reparto: reparto == '' ? editMovie?.reparto : reparto,
            estadoPelicula: estado == '' ? editMovie?.estadoPelicula : estado,
          );
          movies[i] = editMovie!;
        }
      }

      await UnicineApi.put('/actualizar-pelicula', editMovie!.toJson())
          .then((json) {
        loading = false;
        Dialogs.showSnackbarTop(
          context,
          json['mensaje'],
          isError: false,
        );

        _cleanInputs();
        notify();
      }).catchError((e) => throw e);
    } catch (e) {
      Dialogs.showSnackbarTop(
        context,
        e.toString(),
        isError: true,
      );
      log(runtimeType, 'Error en newMovie MovieController $e');
    }
  }

  Future<void> deleteMovie(BuildContext context, int id) async {
    try {
      await UnicineApi.delete('/eliminar-pelicula/$id', {}).then((json) {
        movies.removeWhere((movie) => movie.idPelicula == id);
        loading = false;
        Dialogs.showSnackbarTop(
          context,
          json['mensaje'],
          isError: false,
        );

        _cleanInputs();
        notify();
      }).catchError((e) => throw e);
    } catch (e) {
      Dialogs.showSnackbarTop(
        context,
        e.toString(),
        isError: true,
      );
      log(runtimeType, 'Error en newMovie MovieController $e');
    }
  }

  void getFunctionsMovie() async {
    functionsMovie = [];
    var res = await UnicineApi.httpGet(
        '/obtener-funciones-pelicula/${movieFunction?.idPelicula}');

    for (final i in res['listaFunciones']) {
      functionsMovie.add(FunctionRoom.fromMap(i));
      functionsMovie.toList();
    }

    loading = false;
    getDatesFunction();
    notify();
  }

  void isUpdateMovie() {
    isEdit = !isEdit;
    notify();
  }

  void stateMovie(String estadoPelicula) {
    estado = estadoPelicula;
    notify();
  }

  void isSelectedComboBox() {
    if (estado == '') {
      notSelected = true;
    } else {
      notSelected = false;
    }
    notify();
  }

  void getDatesFunction() {
    for (var t in functionsMovie) {
      theater = t.sala?.teatro;
      functionsDates.add(t.funcion!.horario!);
      distributionChairs = t.sala?.distribucionSilla;
      validateChairs(t.sala?.distribucionSilla);
    }
    notify();
  }

  void validateChairs(DistributionChairs? distribucionSilla) {
    if (distribucionSilla?.filas == 14) chairs = TypeInitChars.initChairs();
    if (distribucionSilla?.filas == 19) chairs = TypeInitChars.type2();
    if (distribucionSilla?.filas == 12) chairs = TypeInitChars.type3();
    notify();
  }
}
