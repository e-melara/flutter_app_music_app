import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_app_music_app/src/providers/auth.dart';
import 'package:flutter_app_music_app/src/utils/responsive.dart';
import 'package:flutter_app_music_app/src/pages/home/home_page.dart';
import 'package:flutter_app_music_app/src/widgets/circle_button.dart';
import 'package:flutter_app_music_app/src/widgets/rounded_button.dart';
import 'package:flutter_app_music_app/src/pages/login/widgets/input_text_login.dart';

class LoginForm extends StatelessWidget {
  void _goTo(BuildContext context, User user) {
    if (user != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, HomePage.routeName, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return SafeArea(
      top: false,
      child: Container(
        width: 300.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InputTextLogin(
              iconPath: "assets/pages/login/icons/email.svg",
              placeholder: "Email Address",
            ),
            SizedBox(height: responsive.ip(2.7)),
            InputTextLogin(
              iconPath: "assets/pages/login/icons/key.svg",
              placeholder: "Password",
            ),
            SizedBox(height: responsive.ip(2.7)),
            Container(
              alignment: Alignment.centerRight,
              child: CupertinoButton(
                child: Text(
                  'Forgot password',
                  style: TextStyle(
                    fontFamily: 'sans',
                  ),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(height: responsive.ip(2.7)),
            RoundedButton(
              onPress: () {},
              title: "Sign in",
            ),
            SizedBox(height: responsive.ip(2.7)),
            Text('Or continue with'),
            SizedBox(height: responsive.ip(2.7)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CircleButton(
                //   size: 55,
                //   iconPath: "assets/pages/login/icons/facebook.svg",
                //   backgroundColor: Color(0xff448AFF),
                //   onPress: () {},
                // ),
                // SizedBox(width: responsive.ip(3.0)),
                CircleButton(
                  size: 55,
                  iconPath: "assets/pages/login/icons/google.svg",
                  backgroundColor: Color(0xffFF1744),
                  onPress: () async {
                    final user = await Auth.instance.google(context);
                    _goTo(context, user);
                  },
                ),
              ],
            ),
            SizedBox(height: responsive.ip(2.8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                CupertinoButton(
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontFamily: 'sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
