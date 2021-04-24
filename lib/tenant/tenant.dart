// To parse this JSON data, do
//
//     final tenantsModel = tenantsModelFromJson(jsonString);

import 'dart:convert';

TenantsModel tenantsModelFromJson(String str) =>
    TenantsModel.fromJson(json.decode(str));

String tenantsModelToJson(TenantsModel data) => json.encode(data.toJson());

class TenantsModel {
  TenantsModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.mobile,
    this.password,
  });

  String id;
  String name;
  String email;
  String username;
  String mobile;
  String password;

  factory TenantsModel.fromJson(Map<String, dynamic> json) => TenantsModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        mobile: json["mobile"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "username": username,
        "mobile": mobile,
        "password": password,
      };
}
