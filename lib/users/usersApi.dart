import 'package:tim_example/models/UserModel.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<UserModel>> getUsers() async {
  var url = Uri.parse('http://10.0.2.2:8000/users');

  http.Response response = await http.get(url);

  if (response.statusCode == 200) {
    print(response.statusCode);
  } else {
    print('404');
  }

  return userModelFromJson(response.body);
}
