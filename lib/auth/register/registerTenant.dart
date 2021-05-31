import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tim_example/models/UserModel.dart';
import 'package:http/http.dart' as http;
import 'package:tim_example/navbar-drawer.dart';

class registerTenant extends StatefulWidget {
  @override
  _registerTenantState createState() => _registerTenantState();
}

class _registerTenantState extends State<registerTenant> {
  UserModel _tenant = UserModel(); //instance of user class

  final _formkey = GlobalKey<FormState>();

  Widget form() => Card(
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
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Name',
                      icon: const Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: const Icon(Icons.person),
                      ),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(8),
                      // ),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Name Field is required';
                      }
                    },
                    onSaved: (String value) {
                      _tenant.name = value;
                    },
                  ),
                ),
                Container(
                  child: TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        icon: const Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: const Icon(Icons.mail),
                        ),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Email is required';
                        }
                      },
                      onSaved: (String value) {
                        _tenant.email = value;
                      }),
                ),
                Container(
                  child: TextFormField(
                      decoration: InputDecoration(
                        // prefixIcon: Icon(
                        //   Icons.vpn_key,
                        //   color: Colors.grey,
                        // ),
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
                        _tenant.password = value;
                      }),
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

  _onSubmit() {
    var form = _formkey.currentState;

    if (form.validate()) {
      form.save();
      registerUser();

      // print(_tenant.name);
      // print(_tenant.email);
      // print(_tenant.password);

      form.reset();
    }
  }

  Future registerUser() async {
    var R_Url = Uri.parse("http://10.0.2.2:8000/users");

    Map mappedUser = {
      'name': _tenant.name,
      'email': _tenant.email,
      'password': _tenant.password
    };

    print("JSON DATA : ${mappedUser}");

    http.Response response = await http.post(
      R_Url,
      body: mappedUser,
      // headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'}
    );
    Navigator.pushNamed(context, '/loginView');

    // print(response.statusCode);
    var data = jsonDecode(response.body);

    // var name = "${data['name']}";
    // print(name);

    // print("DATA: ${data}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Register'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          form(),
          RaisedButton(
            color: Colors.green,
            child: Text('if registered Login Here'),
            onPressed: () {
              Navigator.pushNamed(context, '/loginView');
            },
          ),
        ],
      ),
    );
  }
}
