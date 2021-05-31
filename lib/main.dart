import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'backGroundImage.dart';
// import 'bodytitle.dart';
import 'routeNavigation.dart';
import 'navbar-drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jacks App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/homeView',
      routes: routeNavigation,
    );
  }
}

class myHomePage extends StatefulWidget {
  @override
  _myHomePageState createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
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

  logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.remove('email');
    });
    Navigator.pushNamed(context, '/homeView');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.,
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Gatata Plot Rentals App'),
      ),
      body: Column(
        children: [
          Center(
            child: finalEmail.isEmpty
                ? Text('')
                : Center(
                    child: MaterialButton(
                    child: Text(
                      'Welcome  ' + finalEmail,
                      style:
                          TextStyle(color: Colors.orange[600], fontSize: 25.0),
                    ),
                  )),
          ),
          // bodytitle(),
          startimage('images/gatata.jpg'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: finalEmail.isEmpty
                    ? RaisedButton(
                        child: Text('Login'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/loginView');
                        },
                      )
                    : RaisedButton(
                        child: Text('welcome  ' + finalEmail),
                        onPressed: () {}),
                // RaisedButton(
                //   color: Colors.orange,
                //   child: finalEmail.isEmpty ? Text('Login') : Text(finalEmail),
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/loginView');
                //   },
                // ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: RaisedButton(
                  color: Colors.orange,
                  child: Text(
                    'logOut',
                  ),
                  onPressed: () {
                    logout();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
