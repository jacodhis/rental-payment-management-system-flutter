// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:tim_example/auth/login/Login.dart';
import 'package:tim_example/houses/houses.dart';
// import 'package:tim_example/houses/viewHouse.dart';

import 'package:tim_example/main.dart';
import 'package:tim_example/auth/register/registerTenant.dart';
import 'package:tim_example/menu/selectMenu.dart';
import 'package:tim_example/payment/PayRent.dart';
import 'package:tim_example/users/profile/profile.dart';
import 'package:tim_example/users/usersPage.dart';

var routeNavigation = <String, WidgetBuilder>{
  '/homeView': (context) => myHomePage(),
  '/housesView': (context) => houses(),
  '/loginView': (context) => login(),
  '/registerTenantView': (context) => registerTenant(),
  '/viewUsers': (context) => UsersPage(),
  '/payrent': (context) => PayRent(),
  '/profile': (context) => profile(),
  '/selectMenu': (context) => selectMenu(),
  // '/viewHouse/{house}': (context) => viewHouse(),
};
