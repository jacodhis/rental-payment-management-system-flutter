import 'house.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

// Future<HousesModel> getHouse() async {
//   // var url =
//   //     Uri.parse('https://6078a1c7e7f4f50017184a0b.mockapi.io/gatata/houses');
//   //
//   var url =
//       Uri.parse('https://6078a1c7e7f4f50017184a0b.mockapi.io/gatata/houses/');
//   // var test = Uri.parse(url);
//   final response = await http.get(url);

//   return housesModelFromJson(response.body);
// }

Future<List<HousesModel>> getHouse() async {
  var url =
      Uri.parse('https://6078a1c7e7f4f50017184a0b.mockapi.io/gatata/houses/');

  final response = await http.get(url);

  return housesModelFromJson(response.body);
}
