import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_app_music_app/src/pages/custom_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: SplashPage.routeName,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        LoginPage.routeName: (_) => LoginPage(),
        SplashPage.routeName: (_) => SplashPage(),
      },
    );
  }
}
