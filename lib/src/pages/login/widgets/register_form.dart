import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_music_app/src/utils/app_colors.dart';

import 'package:flutter_app_music_app/src/utils/responsive.dart';
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
                placeholder: "Username",
                iconPath: "assets/pages/login/icons/avatar.svg",
                validator: (text) {
                  return text.trim().length > 0;
                },
              ),
              SizedBox(height: responsive.ip(2.7)),
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
              InputTextLogin(
                iconPath: "assets/pages/login/icons/key.svg",
                placeholder: "Confirm Password",
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
                    onPress: () {},
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
