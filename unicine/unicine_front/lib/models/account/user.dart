import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.label,
    this.idUser,
    this.fullName,
    this.email,
    this.password,
  });

  int? id;
  String? label;
  String? idUser;
  String? fullName;
  String? email;
  String? password;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      label: json["label"],
      idUser: json["idPersona"]?.toString(),
      fullName: json["nombreCompleto"],
      email: json["email"],
      password: json["contrasena"],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json["id"] = id;
    if (label != null) json["label"] = label;
    if (idUser != null) json["idPersona"] = idUser;
    if (fullName != null) json["nombreCompleto"] = fullName;
    if (email != null) json["email"] = email;
    if (password != null) json["contrasena"] = password;

    return json;
  }
}
