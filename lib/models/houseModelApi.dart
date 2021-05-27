import 'dart:convert';

List<HousesModel> housesModelFromJson(String str) => List<HousesModel>.from(
    json.decode(str).map((x) => HousesModel.fromJson(x)));

// HousesModel housesModelFromJson(String str) => HousesModel.fromJson(json.decode(str));

String housesModelToJson(HousesModel data) => json.encode(data.toJson());
// To parse this JSON data, do
//
//     final housesModel = housesModelFromJson(jsonString);

// HousesModel housesModelFromJson(String str) => HousesModel.fromJson(json.decode(str));

class HousesModel {
  HousesModel({
    this.id,
    this.houseNumber,
    this.housePrice,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String houseNumber;
  int housePrice;
  DateTime createdAt;
  String updatedAt;

  factory HousesModel.fromJson(Map<String, dynamic> json) => HousesModel(
        id: json["id"],
        houseNumber: json["houseNumber"],
        housePrice: json["housePrice"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "houseNumber": houseNumber,
        "housePrice": housePrice,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
      };
}
