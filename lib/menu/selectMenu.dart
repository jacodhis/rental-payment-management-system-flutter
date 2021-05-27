import 'package:flutter/material.dart';
import 'package:tim_example/navbar-drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class selectMenu extends StatefulWidget {
  @override
  _selectMenuState createState() => _selectMenuState();
}

class _selectMenuState extends State<selectMenu> {
  @override
  void initState() {
    super.initState();
    getEmail();
  }

  String finalEmail = "";

  Future getEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var obtainedEmail = pref.getString('email') ?? '';
      finalEmail = obtainedEmail;
      print(finalEmail);
    });
  }

  Menu() {
    // var finalemail = true;

    if (finalEmail == '') {
      return Container(
        child: Text('login first'),
      );
    } else {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: RaisedButton(
                color: Colors.orange,
                child: Text(
                  'Pay Rent',
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/payrent');
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: RaisedButton(
                color: Colors.orange,
                child: Text(
                  'view Payments',
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/payments');
                },
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Menu Select'),
      ),
      body: Center(
        child: Menu(),
      ),
    );
  }
}
