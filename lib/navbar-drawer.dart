import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.remove('email');
    });
    Navigator.pushNamed(context, '/homeView');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Gatata Plot',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/image1.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Home Page'),
            onTap: () => {
              Navigator.pushNamed(context, '/homeView'),
            },
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Menu'),
            onTap: () => {
              Navigator.pushNamed(context, '/selectMenu'),
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('users'),
            onTap: () => {
              Navigator.pushNamed(context, '/viewUsers'),
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('profile'),
            onTap: () => {
              Navigator.pushNamed(context, '/profile'),
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('houses'),
            onTap: () => {
              Navigator.pushNamed(context, '/housesView'),
            },
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('email Me'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Login'),
            onTap: () => {
              Navigator.pushNamed(context, '/loginView'),
            },
          ),
          ListTile(
            leading: Icon(Icons.app_registration),
            title: Text('Register Tenant'),
            onTap: () => {
              Navigator.pushNamed(context, '/registerTenantView'),
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {
              logout(),
            },
          ),
        ],
      ),
    );
  }
}
