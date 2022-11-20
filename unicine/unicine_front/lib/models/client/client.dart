import 'dart:convert';

Client userFromJson(String str) => Client.fromJson(json.decode(str));
String userToJson(Client data) => json.encode(data.toJson());

class Client {
  Client({
    this.cedula,
    this.nombreCompleto,
    this.email,
    this.contrasena,
    this.id,
    this.label,
    this.imagenPerfil,
    this.membresia,
    this.estado,
    this.telefonos,
    // this.rol,
  });

  String? cedula;
  String? nombreCompleto;
  String? email;
  String? contrasena;
  int? id;
  String? label;
  // Rol rol;
  String? imagenPerfil;
  bool? membresia;
  bool? estado;
  List<String>? telefonos;

  factory Client.fromJson(String str) => Client.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Client.fromMap(Map<String, dynamic> json) => Client(
        cedula: json["cedula"],
        nombreCompleto: json["nombreCompleto"],
        email: json["email"],
        contrasena: json["contrasena"],
        id: json["id"],
        label: json["label"],
        // rol: Rol.fromMap(json["rol"]),
        imagenPerfil: json["imagenPerfil"],
        membresia: json["membresia"],
        estado: json["estado"],
        telefonos: List<String>.from(json["telefonos"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "cedula": cedula,
        "nombreCompleto": nombreCompleto,
        "email": email,
        "contrasena": contrasena,
        "id": id,
        "label": label,
        // "rol": rol.toMap(),
        "imagenPerfil": imagenPerfil,
        "membresia": membresia,
        "estado": estado,
        "telefonos": List<dynamic>.from(telefonos!.map((x) => x)),
      };
}
