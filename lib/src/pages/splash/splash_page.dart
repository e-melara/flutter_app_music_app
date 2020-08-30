import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:after_layout/after_layout.dart';

import 'package:flutter_app_music_app/src/providers/auth.dart';
import 'package:flutter_app_music_app/src/pages/custom_page.dart';

class SplashPage extends StatefulWidget {
  static final String routeName = 'splash';
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    final user = Auth.instance.user;
    if (user != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, HomePage.routeName, (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, LoginPage.routeName, (route) => false);
    }
  }
}
