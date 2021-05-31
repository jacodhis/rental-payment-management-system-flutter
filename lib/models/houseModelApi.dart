import 'dart:convert';

List<HousesModel> housesModelFromJson(String str) => List<HousesModel>.from(
    json.decode(str).map((x) => HousesModel.fromJson(x)));

// HousesModel housesModelFromJson(String str) => HousesModel.fromJson(json.decode(str));

String housesModelToJson(HousesModel data) => json.encode(data.toJson());

// To parse this JSON data, do
//
//     final housesModel = housesModelFromJson(jsonString);

class HousesModel {
  HousesModel({
    this.id,
    this.houseNumber,
    this.housePrice,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  int id;
  String houseNumber;
  int housePrice;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  factory HousesModel.fromJson(Map<String, dynamic> json) => HousesModel(
        id: json["id"],
        houseNumber: json["houseNumber"],
        housePrice: json["housePrice"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "houseNumber": houseNumber,
        "housePrice": housePrice,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  int id;
  String name;
  String email;
  DateTime emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String image;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": image,
      };
}
