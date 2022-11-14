// To parse this JSON data, do
//
//     final authResponse = authResponseFromMap(jsonString);

import 'dart:convert';

class AuthResponse {
  AuthResponse({
    this.jwttoken,
    this.email,
    this.rol,
  });

  String? jwttoken;
  String? email;
  String? rol;

  factory AuthResponse.fromJson(String str) =>
      AuthResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        jwttoken: json["jwttoken"],
        email: json["email"],
        rol: json["rol"],
      );

  Map<String, dynamic> toMap() => {
        "jwttoken": jwttoken,
        "email": email,
        "rol": rol,
      };
}
