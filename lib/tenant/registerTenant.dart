import 'package:flutter/material.dart';
import 'package:tim_example/models/tenants.dart';
// import 'tenants.dart';
//

class registerTenant extends StatefulWidget {
  @override
  _registerTenantState createState() => _registerTenantState();
}

class _registerTenantState extends State<registerTenant> {
  Tenant _tenant = Tenant();
  List<Tenant> _tenants = [];
  final _formkey = GlobalKey<FormState>();

  Widget form() => Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'First Name'),
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
                    decoration: InputDecoration(labelText: 'Email'),
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
                    decoration: InputDecoration(labelText: 'Username'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'username is required';
                      }
                    },
                    onSaved: (String value) {
                      _tenant.username = value;
                    }),
              ),
              Container(
                child: TextFormField(
                    decoration: InputDecoration(labelText: 'Phone'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'phone is required';
                      }
                    },
                    onSaved: (String value) {
                      _tenant.mobile = value;
                    }),
              ),
              Container(
                child: TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
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
      );

  Widget _onSubmit() {
    var form = _formkey.currentState;

    if (form.validate()) {
      form.save();
      setState(() {
        // form._contact(_contacts);
        var tent = _tenants.add(Tenant(
            id: null,
            name: _tenant.name,
            email: _tenant.email,
            username: _tenant.username,
            mobile: _tenant.mobile,
            password: _tenant.password));
      });
      // print(_tenant.name);
      // print(_tenant.email);
      // print(_tenant.mobile);
      // print(_tenant.username);
      // print(_tenant.password);

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
          form(),
          RaisedButton(
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
