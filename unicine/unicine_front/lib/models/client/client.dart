import 'dart:convert';

Client userFromJson(String str) => Client.fromJson(json.decode(str));
String userToJson(Client data) => json.encode(data.toJson());

class Client {
  Client({
    this.id,
    this.label,
    this.idUser,
    this.profilePicture,
    this.fullName,
    this.email,
    this.password,
    this.membership,
    this.status,
    this.telephones,
  });

  int? id;
  String? label;
  String? idUser;
  String? profilePicture;
  String? fullName;
  String? email;
  String? password;
  bool? membership;
  bool? status;
  List<String>? telephones;

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json["id"],
      label: json["label"],
      idUser: json["cedula"]?.toString(),
      profilePicture: json["imagenPerfil"],
      fullName: json["nombreCompleto"],
      email: json["email"],
      password: json["contrasena"],
      membership: json["membresia"],
      status: json["estado"],
      telephones: json["telefonos"],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json["id"] = id;
    if (label != null) json["label"] = label;
    if (idUser != null) json["cedula"] = idUser;
    if (fullName != null) json["nombreCompleto"] = fullName;
    if (email != null) json["email"] = email;
    if (password != null) json["contrasena"] = password;
    if (membership != null) json["membresia"] = membership;
    if (status != null) json["estado"] = status;
    if (telephones != null) json["telefonos"] = telephones;

    return json;
  }
}
