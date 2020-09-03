import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_music_app/src/providers/auth.dart';
import 'package:flutter_app_music_app/src/utils/app_colors.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_music_app/src/utils/dialogs.dart';
import 'package:flutter_app_music_app/src/utils/extra.dart';
import 'package:flutter_app_music_app/src/utils/responsive.dart';
import 'package:flutter_app_music_app/src/pages/custom_page.dart';
import 'package:flutter_app_music_app/src/widgets/rounded_button.dart';
import 'package:flutter_app_music_app/src/pages/login/widgets/input_text_login.dart';

class RegisterForm extends StatefulWidget {
  final VoidCallback onGoToLogin;

  const RegisterForm({
    Key key,
    @required this.onGoToLogin,
  }) : super(key: key);
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _agree = false;
  GlobalKey<InputTextLoginState> _username = GlobalKey();
  GlobalKey<InputTextLoginState> _email = GlobalKey();
  GlobalKey<InputTextLoginState> _password = GlobalKey();
  GlobalKey<InputTextLoginState> _vpassword = GlobalKey();

  void _goTo(BuildContext context, User user) {
    if (user != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, HomePage.routeName, (route) => false);
    } else {
      print("Register faild");
    }
  }

  void _submit() async {
    final bool validate = _validate();

    if (validate) {
      if (_agree) {
        final values = _getObject();
        final User user = await Auth.instance.signUp(
          context,
          email: values['email'],
          password: values['password'],
          username: values['username'],
        );
        _goTo(context, user);
      } else {
        Dialogs.alert(
          context,
          description: 'You need to accept the terms and conditions',
        );
      }
    } else {
      Dialogs.alert(
        context,
        description: 'Some fields are invalid',
      );
    }
  }

  bool _validate() {
    return (_username.currentState.isOk &&
        _email.currentState.isOk &&
        _password.currentState.isOk &&
        _vpassword.currentState.isOk);
  }

  Map<String, String> _getObject() {
    return {
      "email": _email.currentState.value.trim(),
      "username": _username.currentState.value.trim(),
      "password": _password.currentState.value.trim(),
      "vpassword": _vpassword.currentState.value.trim(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        top: false,
        child: Container(
          constraints: BoxConstraints(maxWidth: 400),
          padding: EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New Account',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: responsive.ip(2.7)),
              InputTextLogin(
                key: _username,
                placeholder: "Username",
                iconPath: "assets/pages/login/icons/avatar.svg",
                validator: (text) {
                  return text.trim().length > 0;
                },
              ),
              SizedBox(height: responsive.ip(2.7)),
              InputTextLogin(
                key: _email,
                placeholder: "Email Address",
                keyInputType: TextInputType.emailAddress,
                iconPath: "assets/pages/login/icons/email.svg",
                validator: (value) => Extra.isValidEmail(value),
              ),
              SizedBox(height: responsive.ip(2.7)),
              InputTextLogin(
                key: _password,
                isSecure: true,
                placeholder: "Password",
                iconPath: "assets/pages/login/icons/key.svg",
                validator: (value) {
                  _vpassword.currentState?.checkoutValidation();
                  return value.trim().length >= 6;
                },
              ),
              SizedBox(height: responsive.ip(2.7)),
              InputTextLogin(
                isSecure: true,
                key: _vpassword,
                placeholder: "Confirm Password",
                iconPath: "assets/pages/login/icons/key.svg",
                validator: (value) {
                  return value.trim().length >= 6 &&
                      value == _password.currentState.value;
                },
              ),
              SizedBox(height: responsive.ip(2.9)),
              DefaultTextStyle(
                style: TextStyle(
                  color: Theme.of(context).textTheme.subtitle1.color,
                  fontSize: responsive.ip(1.6),
                ),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Checkbox(
                      value: _agree,
                      onChanged: (value) {
                        setState(() {
                          _agree = value;
                        });
                      },
                    ),
                    Text('I Agree to the'),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Terms of services',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(' & '),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: responsive.ip(2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    onPressed: widget.onGoToLogin,
                    child: Text('← Back to Log In'),
                  ),
                  SizedBox(width: 10.0),
                  RoundedButton(
                    onPress: _submit,
                    title: "Sign Up",
                  ),
                ],
              ),
              SizedBox(height: responsive.ip(2)),
            ],
          ),
        ),
      ),
    );
  }
}
