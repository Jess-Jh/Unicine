// To parse this JSON data, do
//
//     final pqrs = pqrsFromMap(jsonString);

import 'dart:convert';

import 'package:uni_cine/models/client/client.dart';

class Pqrs {
  Pqrs({
    this.idPqrs,
    this.mensaje,
    this.cliente,
  });

  int? idPqrs;
  String? mensaje;
  Client? cliente;

  factory Pqrs.fromJson(String str) => Pqrs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pqrs.fromMap(Map<String, dynamic> json) => Pqrs(
        idPqrs: json["idPQRS"],
        mensaje: json["mensaje"],
        cliente: Client.fromMap(json["cliente"]),
      );

  Map<String, dynamic> toMap() => {
        "idPQRS": idPqrs,
        "mensaje": mensaje,
        "cliente": cliente?.toMap(),
      };
}
