import 'package:flutter/material.dart';
import 'package:tim_example/models/UserModel.dart';
import 'usersApi.dart';
import 'package:tim_example/navbar-drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
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

  Users() {
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
      return Container(
        child: FutureBuilder(
          future: getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return users(snapshot.data);
              // return Text(snapshot.data.houseNumber);
            } else if (snapshot.hasError) {
              // return CircularProgressIndicator();
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      );
    }
  }

  users(List<UserModel> getUsers) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Person')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Email')),
      ],
      rows:
          getUsers // Loops through dataColumnText, each iteration assigning the value to element
              .map(
                ((element) => DataRow(
                      cells: <DataCell>[
                        DataCell(Icon(Icons.account_circle)),
                        DataCell(
                          Text(element.name),
                        ),
                        DataCell(Text(element.email)),
                      ],
                    )),
              )
              .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Gatata Tenants'),
      ),
      body: Users(),
    );
  }
}
