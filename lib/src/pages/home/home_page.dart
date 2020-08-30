import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_music_app/src/providers/auth.dart';

class HomePage extends StatefulWidget {
  static final String routeName = 'home';
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = Auth.instance.user;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: SafeArea(
          child: ListView(
            children: [
              SizedBox(height: 10),
              CircleAvatar(
                radius: 40,
                child: user.photoURL != null
                    ? ClipOval(
                        child: Image.network(
                          user.photoURL,
                          width: 74,
                          height: 74,
                          fit: BoxFit.cover,
                        ),
                      )
                    : _alias(user.displayName),
              ),
              SizedBox(height: 10),
              Text(
                user.displayName,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                user.email,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              CupertinoButton(
                child: Text(
                  'Logout',
                  style: TextStyle(fontSize: 19),
                ),
                onPressed: () async {
                  await Auth.instance.logoutOut(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _alias(displayName) {
    String alias = '';
    final List<String> tmp = displayName.split(' ');
    if (tmp.length > 0) {
      alias = tmp[0][0];
      if (tmp.length == 2) {
        alias += tmp[1][0];
      }
    }
    return Center(
      child: Text(
        alias,
        style: TextStyle(fontSize: 30.0),
      ),
    );
  }
}
