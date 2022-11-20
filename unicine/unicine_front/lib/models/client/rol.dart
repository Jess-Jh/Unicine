// To parse this JSON data, do
//
//     final rol = rolFromMap(jsonString);

import 'dart:convert';

class Rol {
  Rol({
    this.codigo,
    this.nombre,
  });

  int? codigo;
  String? nombre;

  factory Rol.fromJson(String str) => Rol.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rol.fromMap(Map<String, dynamic> json) => Rol(
        codigo: json["codigo"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toMap() => {
        "codigo": codigo,
        "nombre": nombre,
      };
}
