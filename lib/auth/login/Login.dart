import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tim_example/navbar-drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  String email;
  String password;
  // UserModel _tenant = UserModel(); //instance of user class

  final _formkey = GlobalKey<FormState>();
  Widget _loginForm() => Card(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: const Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: const Icon(Icons.account_circle),
                      ),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'username is required';
                      }
                    },
                    onSaved: (String value) {
                      email = value;
                    },
                  ),
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      icon: const Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: const Icon(Icons.lock),
                      ),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'password is required';
                      }
                    },
                    onSaved: (String value) {
                      password = value;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    onPressed: () => _onSubmit(),
                    child: Text('submit'),
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _onSubmit() {
    var form = _formkey.currentState;

    if (form.validate()) {
      form.save();
      login();

      form.reset();
    }
  }

  Future login() async {
    var R_Url = Uri.parse("http://10.0.2.2:8000/loginUser");

    Map mappedUser = {'email': email, 'password': password};

    print("JSON DATA : ${mappedUser}");

    http.Response response = await http.post(
      R_Url,
      body: mappedUser,
      // headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'}
    );
    String message = "not found";

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (message == data) {
        String error = 'user not found';
        print(error);
      } else {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('email', email);

        Navigator.pushNamed(context, '/selectMenu');

        // print(data);
      }

      // Navigator.pushNamed(context, '/welcomePage');
    } else {
      print(response.statusCode);
    }

    // var name = "${data['name']}";
    // print(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _loginForm(),
          RaisedButton(
            color: Colors.green,
            child: Text(
              'Not registered!! Register Here',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/registerTenantView');
            },
          ),
        ],
      ),
    );
  }
}
