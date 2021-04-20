import 'package:flutter/material.dart';

class viewHouse extends StatelessWidget {
  String house;
  String houseNumber;
  String housePrice;

  viewHouse({Key key, @required this.house, this.houseNumber, this.housePrice})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Gatata Plot Rentals App'),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(houseNumber),
          ),
          Container(
            child: Text(housePrice),
          ),
          Container(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  child: Text(
                    'Occupant',
                    style: TextStyle(color: Colors.amber[800]),
                  ),
                ),
                Text('Users Details'),
                Text('payment details'),
                Text('pay Rent here'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
