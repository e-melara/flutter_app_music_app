import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_music_app/src/utils/app_colors.dart';

import 'package:flutter_app_music_app/src/utils/responsive.dart';
import 'package:flutter_app_music_app/src/widgets/rounded_button.dart';
import 'package:flutter_app_music_app/src/pages/login/widgets/input_text_login.dart';

class ForgotPasswordForm extends StatefulWidget {
  final VoidCallback onGoToLogin;

  const ForgotPasswordForm({
    Key key,
    @required this.onGoToLogin,
  }) : super(key: key);
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Align(
      alignment: Alignment.center,
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
                'Forgot Password',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(
                height: responsive.ip(1.8),
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: responsive.ip(2.7)),
              InputTextLogin(
                iconPath: "assets/pages/login/icons/email.svg",
                placeholder: "Email Address",
              ),
              SizedBox(height: responsive.ip(2.7)),
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
                    title: "Send",
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
