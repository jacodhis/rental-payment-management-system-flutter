// import 'houseModelApi.dart';
// import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:tim_example/models/houseModelApi.dart';

Future<List<HousesModel>> getHouse() async {
  var url = Uri.parse('http://10.0.2.2:8000/houses');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    print(response.statusCode);
    print(response.body);
  } else {
    print('error loading houses');
  }
  return housesModelFromJson(response.body);
}
