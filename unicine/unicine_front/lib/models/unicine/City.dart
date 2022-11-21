// To parse this JSON data, do
//
//     final city = cityFromMap(jsonString);

import 'dart:convert';

class City {
  City({
    this.idCiudad,
    this.nombre,
  });

  int? idCiudad;
  String? nombre;

  factory City.fromJson(String str) => City.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory City.fromMap(Map<String, dynamic> json) => City(
        idCiudad: json["idCiudad"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toMap() => {
        "idCiudad": idCiudad,
        "nombre": nombre,
      };
}
