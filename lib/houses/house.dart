import 'dart:convert';

List<HousesModel> housesModelFromJson(String str) => List<HousesModel>.from(
    json.decode(str).map((x) => HousesModel.fromJson(x)));

String housesModelToJson(List<HousesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HousesModel {
  HousesModel({
    this.id,
    this.houseNumber,
    this.housePrice,
  });

  String id;
  String houseNumber;
  String housePrice;

  factory HousesModel.fromJson(Map<String, dynamic> json) => HousesModel(
        id: json["id"],
        houseNumber: json["houseNumber"],
        housePrice: json["housePrice"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "houseNumber": houseNumber,
        "housePrice": housePrice,
      };
}
