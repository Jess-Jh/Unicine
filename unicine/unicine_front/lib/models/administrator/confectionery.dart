// To parse this JSON data, do
//
//     final confectionery = confectioneryFromMap(jsonString);

import 'dart:convert';

class Confectionery {
  Confectionery({
    this.idConfiteria,
    this.imagen,
    this.precio,
    this.nombre,
    this.cant,

    // this.listaConfiteriaCompra,
  });

  int? idConfiteria;
  String? imagen;
  double? precio;
  String? nombre;
  int? cant;
  // List<ListaConfiteriaCompra> listaConfiteriaCompra;

  factory Confectionery.fromJson(String str) =>
      Confectionery.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Confectionery.fromMap(Map<String, dynamic> json) => Confectionery(
        idConfiteria: json["idConfiteria"],
        imagen: json["imagen"],
        precio: json["precio"],
        nombre: json["nombre"],
        // listaConfiteriaCompra: List<ListaConfiteriaCompra>.from(json["listaConfiteriaCompra"].map((x) => ListaConfiteriaCompra.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "idConfiteria": idConfiteria,
        "imagen": imagen,
        "precio": precio,
        "nombre": nombre,
        // "listaConfiteriaCompra": List<dynamic>.from(listaConfiteriaCompra.map((x) => x.toMap())),
      };
}

// class ListaConfiteriaCompra {
//     ListaConfiteriaCompra({
//         this.idConfiteriaCompra,
//         this.precio,
//         this.unidades,
//     });

//      double idConfiteriaCompra;
//     int precio;
//     int unidades;

//     factory ListaConfiteriaCompra.fromJson(String str) => ListaConfiteriaCompra.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory ListaConfiteriaCompra.fromMap(Map<String, dynamic> json) => ListaConfiteriaCompra(
//         idConfiteriaCompra: json["idConfiteriaCompra"],
//         precio: json["precio"],
//         unidades: json["unidades"],
//     );

//     Map<String, dynamic> toMap() => {
//         "idConfiteriaCompra": idConfiteriaCompra,
//         "precio": precio,
//         "unidades": unidades,
//     };
// }
