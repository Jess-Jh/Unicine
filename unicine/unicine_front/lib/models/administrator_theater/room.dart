// To parse this JSON data, do
//
//     final room = roomFromMap(jsonString);

import 'dart:convert';

class Room {
  Room({
    this.idSala,
    this.nombre,
    this.listaDistribuccionSillas,
    // this.listaFuncionSala,
  });

  int? idSala;
  String? nombre;
  List<ListaDistribuccionSilla>? listaDistribuccionSillas;
  // List<ListaFuncionSala> listaFuncionSala;

  factory Room.fromJson(String str) => Room.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Room.fromMap(Map<String, dynamic> json) => Room(
        idSala: json["idSala"],
        nombre: json["nombre"],
        listaDistribuccionSillas: List<ListaDistribuccionSilla>.from(
            json["listaDistribuccionSillas"]
                .map((x) => ListaDistribuccionSilla.fromMap(x))),
        // listaFuncionSala: List<ListaFuncionSala>.from(json["listaFuncionSala"].map((x) => ListaFuncionSala.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "idSala": idSala,
        "nombre": nombre,
        "listaDistribuccionSillas":
            List<dynamic>.from(listaDistribuccionSillas!.map((x) => x.toMap())),
        // "listaFuncionSala": List<dynamic>.from(listaFuncionSala.map((x) => x.toMap())),
      };
}

class ListaDistribuccionSilla {
  ListaDistribuccionSilla({
    this.idDistribuccionSilla,
    this.distribuccionSillas,
    this.totalSillas,
    this.filas,
    this.columnas,
  });

  int? idDistribuccionSilla;
  String? distribuccionSillas;
  int? totalSillas;
  int? filas;
  int? columnas;

  factory ListaDistribuccionSilla.fromJson(String str) =>
      ListaDistribuccionSilla.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListaDistribuccionSilla.fromMap(Map<String, dynamic> json) =>
      ListaDistribuccionSilla(
        idDistribuccionSilla: json["idDistribuccionSilla"],
        distribuccionSillas: json["distribuccionSillas"],
        totalSillas: json["totalSillas"],
        filas: json["filas"],
        columnas: json["columnas"],
      );

  Map<String, dynamic> toMap() => {
        "idDistribuccionSilla": idDistribuccionSilla,
        "distribuccionSillas": distribuccionSillas,
        "totalSillas": totalSillas,
        "filas": filas,
        "columnas": columnas,
      };
}

// class ListaFuncionSala {
//     ListaFuncionSala({
//         this.idFuncionSala,
//         this.listaCompras,
//     });

//     int idFuncionSala;
//     List<ListaCompra> listaCompras;

//     factory ListaFuncionSala.fromJson(String str) => ListaFuncionSala.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory ListaFuncionSala.fromMap(Map<String, dynamic> json) => ListaFuncionSala(
//         idFuncionSala: json["idFuncionSala"],
//         listaCompras: List<ListaCompra>.from(json["listaCompras"].map((x) => ListaCompra.fromMap(x))),
//     );

//     Map<String, dynamic> toMap() => {
//         "idFuncionSala": idFuncionSala,
//         "listaCompras": List<dynamic>.from(listaCompras.map((x) => x.toMap())),
//     };
// }

// class ListaCompra {
//     ListaCompra({
//         this.idCompra,
//         this.fechaCompra,
//         this.metodoPago,
//         this.subtotal,
//         this.total,
//         this.listaEntradas,
//         this.listaConfiteriaCompra,
//     });

//     int idCompra;
//     DateTime fechaCompra;
//     String metodoPago;
//     int subtotal;
//     int total;
//     List<ListaEntrada> listaEntradas;
//     List<ListaConfiteriaCompra> listaConfiteriaCompra;

//     factory ListaCompra.fromJson(String str) => ListaCompra.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory ListaCompra.fromMap(Map<String, dynamic> json) => ListaCompra(
//         idCompra: json["idCompra"],
//         fechaCompra: DateTime.parse(json["fechaCompra"]),
//         metodoPago: json["metodoPago"],
//         subtotal: json["subtotal"],
//         total: json["total"],
//         listaEntradas: List<ListaEntrada>.from(json["listaEntradas"].map((x) => ListaEntrada.fromMap(x))),
//         listaConfiteriaCompra: List<ListaConfiteriaCompra>.from(json["listaConfiteriaCompra"].map((x) => ListaConfiteriaCompra.fromMap(x))),
//     );

//     Map<String, dynamic> toMap() => {
//         "idCompra": idCompra,
//         "fechaCompra": fechaCompra.toIso8601String(),
//         "metodoPago": metodoPago,
//         "subtotal": subtotal,
//         "total": total,
//         "listaEntradas": List<dynamic>.from(listaEntradas.map((x) => x.toMap())),
//         "listaConfiteriaCompra": List<dynamic>.from(listaConfiteriaCompra.map((x) => x.toMap())),
//     };
// }

// class ListaConfiteriaCompra {
//     ListaConfiteriaCompra({
//         this.idConfiteriaCompra,
//         this.precio,
//         this.unidades,
//     });

//     int idConfiteriaCompra;
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

// class ListaEntrada {
//     ListaEntrada({
//         this.idEntrada,
//         this.filaSilla,
//         this.columnaSilla,
//         this.precio,
//     });

//     int idEntrada;
//     String filaSilla;
//     String columnaSilla;
//     int precio;

//     factory ListaEntrada.fromJson(String str) => ListaEntrada.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory ListaEntrada.fromMap(Map<String, dynamic> json) => ListaEntrada(
//         idEntrada: json["idEntrada"],
//         filaSilla: json["filaSilla"],
//         columnaSilla: json["columnaSilla"],
//         precio: json["precio"],
//     );

//     Map<String, dynamic> toMap() => {
//         "idEntrada": idEntrada,
//         "filaSilla": filaSilla,
//         "columnaSilla": columnaSilla,
//         "precio": precio,
//     };
// }
