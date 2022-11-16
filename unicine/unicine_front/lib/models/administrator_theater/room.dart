// To parse this JSON data, do
//
//     final room = roomFromMap(jsonString);

import 'dart:convert';

import 'package:uni_cine/models/administrator_theater/distribution_chairs.dart';

class Room {
  Room({
    this.idSala,
    this.nombre,
    this.distribucionSilla,
    // this.listaFuncionSala,
  });

  int? idSala;
  String? nombre;
  DistributionChairs? distribucionSilla;
  // List<ListaFuncionSala> listaFuncionSala;

  factory Room.fromJson(String str) => Room.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Room.fromMap(Map<String, dynamic> json) => Room(
        idSala: json["idSala"],
        nombre: json["nombre"],
        // listaFuncionSala: List<ListaFuncionSala>.from(json["listaFuncionSala"].map((x) => ListaFuncionSala.fromMap(x))),
        distribucionSilla:
            DistributionChairs.fromMap(json["distribucionSilla"]),
      );

  Map<String, dynamic> toMap() => {
        "idSala": idSala,
        "nombre": nombre,
        // "listaFuncionSala": List<dynamic>.from(listaFuncionSala.map((x) => x.toMap())),
        "distribucionSilla": distribucionSilla?.toMap(),
      };
}
