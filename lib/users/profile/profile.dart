import 'package:flutter/material.dart';
import 'package:tim_example/navbar-drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
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

  UserProfile() {
    if (finalEmail == '') {
      return Container(
        child: Center(
          child: Text('login first'),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/ninja.jpg'),
                radius: 40.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.white,
            ),
            Expanded(
              child: Column(
                children: [
                  name(),
                  SizedBox(
                    //adding a space between 2 different widgets
                    height: 10.0,
                  ),
                  email(),
                  SizedBox(
                    //adding a space between 2 different widgets
                    height: 10.0,
                  ),
                  house(),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  name() {
    return Column(
      children: [
        Container(
          child: Text(
            'name',
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 2.0,
            ),
          ),
        ),
        SizedBox(
          //adding a space between 2 different widgets
          height: 10.0,
        ),
        Container(
          child: Text(
            'jack odhiambo',
            style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  email() {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              'Email',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
              ),
            ),
          ),
          SizedBox(
            //adding a space between 2 different widgets
            height: 10.0,
          ),
          Container(
            child: Text(
              'odhiambojack536@gmail.com',
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  house() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text('house number'),
        ),
        Text('house Price'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your Profile'),
      ),
      body: UserProfile(),
      floatingActionButton: FloatingActionButton(
        child: Text('edit user'),
        onPressed: () {},
      ),
    );
  }
}
