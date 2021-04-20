// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:tim_example/Login.dart';
import 'package:tim_example/houses/houses.dart';
// import 'package:tim_example/houses/viewHouse.dart';

import 'package:tim_example/main.dart';
import 'package:tim_example/tenant/registerTenant.dart';
// import 'package:navigation_flutter/tenants.dart';
import 'routingStrings.dart';

var routeNavigation = <String, WidgetBuilder>{
  '/homeView': (context) => myHomePage(),
  '/housesView': (context) => houses(),
  '/loginView': (context) => login(),
  '/registerTenantView': (context) => registerTenant(),
  // '/viewHouse/{house}': (context) => viewHouse(),
};
