// To parse this JSON data, do
//
//     final manageMovie = manageMovieFromMap(jsonString);

import 'dart:convert';

class Movie {
  Movie({
    this.idPelicula,
    this.nombre,
    this.imagen,
    this.trailer,
    this.genero,
    this.sinopsis,
    this.reparto,
    this.listaFuncionSala,
  });

  int? idPelicula;
  String? nombre;
  String? imagen;
  String? trailer;
  String? genero;
  String? sinopsis;
  String? reparto;
  List<dynamic>? listaFuncionSala;

  factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        idPelicula: json["idPelicula"],
        nombre: json["nombre"],
        imagen: json["imagen"],
        trailer: json["trailer"],
        genero: json["genero"],
        sinopsis: json["sinopsis"],
        reparto: json["reparto"],
        listaFuncionSala:
            List<dynamic>.from(json["listaFuncionSala"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "idPelicula": idPelicula,
        "nombre": nombre,
        "imagen": imagen,
        "trailer": trailer,
        "genero": genero,
        "sinopsis": sinopsis,
        "reparto": reparto,
        "listaFuncionSala": List<dynamic>.from(listaFuncionSala!.map((x) => x)),
      };
}
