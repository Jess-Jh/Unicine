// To parse this JSON data, do
//
//     final purchase = purchaseFromMap(jsonString);

import 'dart:convert';

class Purchase {
  Purchase({
    this.idCompra,
    this.fechaCompra,
    this.metodoPago,
    this.subtotal,
    this.total,
  });

  int? idCompra;
  DateTime? fechaCompra;
  String? metodoPago;
  double? subtotal;
  double? total;

  factory Purchase.fromJson(String str) => Purchase.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Purchase.fromMap(Map<String, dynamic> json) => Purchase(
        idCompra: json["idCompra"],
        fechaCompra: DateTime.parse(json["fechaCompra"]),
        metodoPago: json["metodoPago"],
        subtotal: json["subtotal"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "idCompra": idCompra,
        "fechaCompra": fechaCompra.toString(),
        "metodoPago": metodoPago,
        "subtotal": subtotal,
        "total": total,
      };
}
