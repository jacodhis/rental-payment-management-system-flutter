import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tim_example/navbar-drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'imagefunction.dart';
import 'package:tim_example/models/UserModel.dart';

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

  // upload picture
  String _image;
  String localImage;
  upload() async {
    localImage = await pickImage();
    // setState(() {
    _image = localImage;
    // });

    // print(localImage);
  }

  UserProfile() {
    if (finalEmail == '') {
      return Container(
        child: Center(
          child: MaterialButton(
            color: Colors.blue,
            child: Text(
              'login Here First',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            onPressed: () => {
              Navigator.pushNamed(context, '/loginView'),
            },
          ),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: profile(),
            ),
            // profile(),
          ],
        ),
      );
    }
  }

  Widget profile() {
    return Container(
      child: FutureBuilder(
        future: getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  UserModel user = snapshot.data[index];

                  return Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 50.0,
                            child: Text(user.name),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Center(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: MaterialButton(
                                      color: Colors.blue,
                                      child: Text(
                                        'upload Image',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        upload();
                                      }),
                                ),
                                Container(
                                  child: MaterialButton(
                                    color: Colors.red,
                                    onPressed: () {},
                                    child: Text(
                                      'Edit information ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 60.0,
                          color: Colors.black,
                        ),
                        Text(
                          'NAME',
                          style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(
                          //adding a space between 2 different widgets
                          height: 10.0,
                        ),
                        Text(
                          user.name,
                          style: TextStyle(
                              color: Colors.amberAccent[200],
                              letterSpacing: 2.0,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'EMAIL',
                          style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(
                          //adding a space between 2 different widgets
                          height: 10.0,
                        ),
                        Text(
                          user.email,
                          style: TextStyle(
                              color: Colors.amberAccent[200],
                              letterSpacing: 2.0,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                          child: RaisedButton(
                            color: Colors.blue,
                            child: Text(
                              'view Payments',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/payments');
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                });
            // return snapshot.data;
          } else if (snapshot.hasError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Future<List<UserModel>> getUser() async {
    // print('hello user');
    var R_Url = Uri.parse("http://10.0.2.2:8000/users/email");

    Map mappedUserEmail = {
      'email': finalEmail,
    };

    http.Response response = await http.post(
      R_Url,
      body: mappedUserEmail,
    );

    if (response.statusCode == 200) {
      // print(response.body);
      // var data = jsonDecode(response.body);
      // print(data);
      return userModelFromJson(response.body);
    } else {
      print(response.statusCode);
    }
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
    );
  }
}
