// To parse this JSON data, do
//
//     final functionRoom = functionRoomFromMap(jsonString);

import 'dart:convert';

import 'package:uni_cine/models/administrator/movie.dart';
import 'package:uni_cine/models/administrator_theater/room.dart';

class FunctionRoom {
  FunctionRoom({
    this.idFuncionSala,
    this.sala,
    this.pelicula,
    // this.funcion,
  });

  int? idFuncionSala;
  Room? sala;
  Movie? pelicula;
  // Funcion funcion;

  factory FunctionRoom.fromJson(String str) =>
      FunctionRoom.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FunctionRoom.fromMap(Map<String, dynamic> json) => FunctionRoom(
        idFuncionSala: json["idFuncionSala"],
        sala: Room.fromMap(json["sala"]),
        pelicula: Movie.fromMap(json["pelicula"]),
        // funcion: Funcion.fromMap(json["funcion"]),
      );

  Map<String, dynamic> toMap() => {
        "idFuncionSala": idFuncionSala,
        "sala": sala?.toMap(),
        "pelicula": pelicula?.toMap(),
        // "funcion": funcion.toMap(),
      };
}
