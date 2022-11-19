import 'dart:convert';

import 'package:uni_cine/models/administrator/theater.dart';
import 'package:uni_cine/models/administrator_theater/distribution_chairs.dart';

class RoomFunction {
  RoomFunction({
    this.idSala,
    this.nombre,
    this.teatro,
    this.distribucionSilla,
  });

  int? idSala;
  String? nombre;
  Theater? teatro;
  DistributionChairs? distribucionSilla;

  factory RoomFunction.fromJson(String str) =>
      RoomFunction.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RoomFunction.fromMap(Map<String, dynamic> json) => RoomFunction(
        idSala: json["idSala"],
        nombre: json["nombre"],
        teatro: Theater.fromMap(json["teatro"]),
        distribucionSilla:
            DistributionChairs.fromMap(json["distribucionSilla"]),
      );

  Map<String, dynamic> toMap() => {
        "idSala": idSala,
        "nombre": nombre,
        "teatro": teatro?.toMap(),
        "distribucionSilla": distribucionSilla?.toMap(),
      };
}
