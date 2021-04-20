import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final _formkey = GlobalKey<FormState>();
  Widget _loginForm() => Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Username'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'username is required';
                    }
                  },
                ),
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'password is required';
                    }
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
      );

  Widget _onSubmit() {
    var form = _formkey.currentState;

    if (form.validate()) {
      form.save();

      form.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Gatata Plot Rentals App'),
      ),
      body: Column(
        children: [
          _loginForm(),
          RaisedButton(
            child: Text('Not registered; Register Here'),
            onPressed: () {
              Navigator.pushNamed(context, '/registerTenantView');
            },
          ),
        ],
      ),
    );
  }
}
