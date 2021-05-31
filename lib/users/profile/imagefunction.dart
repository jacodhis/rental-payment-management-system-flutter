import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:permission_handler/permission_handler.dart';

Future<String> pickImage() async {
  File file;
  PickedFile pickedFile;
  ImagePicker imagePicker = ImagePicker();

  // await Permission.photos.request();

  // var permissionStatus = await Permission.photos.status;

  // if (permissionStatus.isGranted) {
  pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    file = File(pickedFile.path);

    String image = base64Encode(file.readAsBytesSync());
    return image;
  } else {
    print('pick image first');
    return 'Error';
  }
  // } else {
  //   print('give permission first');
  //   return 'Error';
  // }
}

// Future uploadImage() async {
//   var R_Url = Uri.parse("http://10.0.2.2:8000/image");

//   Map mappedImage = {
//     // 'name': image,
//   };

//   print("JSON DATA : ${mappedImage}");

//   http.Response response = await http.post(
//     R_Url,
//     body: mappedImage,
//   );
//   // Navigator.pushNamed(context, '/profile');

//   String data = jsonDecode(response.body);
//   print("DATA: ${data}");
//   return data;
// }
