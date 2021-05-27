import 'package:flutter/material.dart';

class bodytitle extends StatelessWidget {
  final double _hpad = 16;
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(_hpad, 20.0, _hpad, 4.0),
          // child: Row(
          //   children: [
          //     Container(
          //       child: Text(
          //         'Rental Payment System',
          //         style: TextStyle(
          //           color: Colors.black,
          //           fontSize: 16.0,
          //         ),
          //       ),
          //     ),

          //   ],
          // ),
        ),
      ],
    );
  }
}
