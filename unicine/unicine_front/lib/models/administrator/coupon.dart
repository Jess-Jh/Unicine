// To parse this JSON data, do
//
//     final coupon = couponFromMap(jsonString);

import 'dart:convert';

class Coupon {
  Coupon({
    this.idCupon,
    this.valorDescuento,
    this.fechaVencimiento,
    this.descripcion,
    this.criterio,
    // this.listaCuponClientes,
  });

  int? idCupon;
  double? valorDescuento;
  DateTime? fechaVencimiento;
  String? descripcion;
  String? criterio;
  // List<ListaCuponCliente> listaCuponClientes;

  factory Coupon.fromJson(String str) => Coupon.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Coupon.fromMap(Map<String, dynamic> json) => Coupon(
        idCupon: json["idCupon"],
        valorDescuento: json["valorDescuento"],
        fechaVencimiento: DateTime.parse(json["fechaVencimiento"]),
        descripcion: json["descripcion"],
        criterio: json["criterio"],
        // listaCuponClientes: List<ListaCuponCliente>.from(json["listaCuponClientes"].map((x) => ListaCuponCliente.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "idCupon": idCupon,
        "valorDescuento": valorDescuento,
        "fechaVencimiento":
            "${fechaVencimiento?.year.toString().padLeft(4, '0')}-${fechaVencimiento?.month.toString().padLeft(2, '0')}-${fechaVencimiento?.day.toString().padLeft(2, '0')}",
        "descripcion": descripcion,
        "criterio": criterio,
        // "listaCuponClientes": List<dynamic>.from(listaCuponClientes.map((x) => x.toMap())),
      };
}

// class ListaCuponCliente {
//     ListaCuponCliente({
//         this.idCuponCliente,
//         this.isDisponible,
//         this.listaCompras,
//     });

//     int idCuponCliente;
//     int isDisponible;
//     List<ListaCompra> listaCompras;

//     factory ListaCuponCliente.fromJson(String str) => ListaCuponCliente.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory ListaCuponCliente.fromMap(Map<String, dynamic> json) => ListaCuponCliente(
//         idCuponCliente: json["idCuponCliente"],
//         isDisponible: json["isDisponible"],
//         listaCompras: List<ListaCompra>.from(json["listaCompras"].map((x) => ListaCompra.fromMap(x))),
//     );

//     Map<String, dynamic> toMap() => {
//         "idCuponCliente": idCuponCliente,
//         "isDisponible": isDisponible,
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
