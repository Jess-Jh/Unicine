// To parse this JSON data, do
//
//     final hour = hourFromMap(jsonString);

import 'dart:convert';

class Hour {
  Hour({
    this.idHorario,
    this.fecha,
    this.hora,
    // this.listaFunciones,
  });

  int? idHorario;
  DateTime? fecha;
  String? hora;
  // List<ListaFuncione> listaFunciones;

  factory Hour.fromJson(String str) => Hour.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Hour.fromMap(Map<String, dynamic> json) => Hour(
        idHorario: json["idHorario"],
        fecha: DateTime.parse(json["fecha"]),
        hora: json["hora"],
        // listaFunciones: List<ListaFuncione>.from(json["listaFunciones"].map((x) => ListaFuncione.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "idHorario": idHorario,
        "fecha":
            "${fecha?.year.toString().padLeft(4, '0')}-${fecha?.month.toString().padLeft(2, '0')}-${fecha?.day.toString().padLeft(2, '0')}",
        "hora": hora,
        // "listaFunciones": List<dynamic>.from(listaFunciones.map((x) => x.toMap())),
      };
}

// class ListaFuncione {
//     ListaFuncione({
//         this.idFuncion,
//         this.precio,
//         this.listaFuncionSala,
//     });

//     int idFuncion;
//     int precio;
//     List<ListaFuncionSala> listaFuncionSala;

//     factory ListaFuncione.fromJson(String str) => ListaFuncione.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory ListaFuncione.fromMap(Map<String, dynamic> json) => ListaFuncione(
//         idFuncion: json["idFuncion"],
//         precio: json["precio"],
//         listaFuncionSala: List<ListaFuncionSala>.from(json["listaFuncionSala"].map((x) => ListaFuncionSala.fromMap(x))),
//     );

//     Map<String, dynamic> toMap() => {
//         "idFuncion": idFuncion,
//         "precio": precio,
//         "listaFuncionSala": List<dynamic>.from(listaFuncionSala.map((x) => x.toMap())),
//     };
// }

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
