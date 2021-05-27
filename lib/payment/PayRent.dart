import 'package:flutter/material.dart';
import 'package:tim_example/navbar-drawer.dart';

class PayRent extends StatefulWidget {
  @override
  _PayRentState createState() => _PayRentState();
}

class _PayRentState extends State<PayRent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Pay Rent'),
      ),
    );
  }
}
