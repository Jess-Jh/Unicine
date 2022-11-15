// To parse this JSON data, do
//
//     final distributionChairs = distributionChairsFromMap(jsonString);

import 'dart:convert';

class DistributionChairs {
  DistributionChairs({
    this.idDistribucionSilla,
    this.distribucionSillas,
    this.totalSillas,
    this.filas,
    this.columnas,
  });

  int? idDistribucionSilla;
  String? distribucionSillas;
  int? totalSillas;
  int? filas;
  int? columnas;

  factory DistributionChairs.fromJson(String str) =>
      DistributionChairs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DistributionChairs.fromMap(Map<String, dynamic> json) =>
      DistributionChairs(
        idDistribucionSilla: json["idDistribuccionSilla"],
        distribucionSillas: json["distribuccionSillas"],
        totalSillas: json["totalSillas"],
        filas: json["filas"],
        columnas: json["columnas"],
      );

  Map<String, dynamic> toMap() => {
        "idDistribuccionSilla": idDistribucionSilla,
        "distribuccionSillas": distribucionSillas,
        "totalSillas": totalSillas,
        "filas": filas,
        "columnas": columnas,
      };
}
