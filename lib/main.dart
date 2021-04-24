import 'package:flutter/material.dart';
import 'package:tim_example/tenant/registerTenant.dart';
import 'backGroundImage.dart';
import 'bodytitle.dart';
// import 'houses.dart';
import 'Login.dart';
import 'routeNavigation.dart';

// import './imports/importsFile.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jacks App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      // home: myHomePage(),
      initialRoute: '/homeView',
      routes: routeNavigation,
    );
  }
}

class myHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Gatata Plot Rentals App'),
      ),
      body: Column(
        children: [
          bodytitle(),
          startimage('images/gatata.jpg'),
          // houses(),
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 30, 20.0, 0.0),
                child: RaisedButton(
                  color: Colors.orange,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/loginView');
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: RaisedButton(
                  color: Colors.orange,
                  child: Text(
                    'Register Tenant',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/registerTenantView');
                  },
                ),
              ),

              // child: login(),
            ],
          ),
        ],
      ),
    );
  }
}
