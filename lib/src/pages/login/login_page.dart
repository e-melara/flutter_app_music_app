import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter_app_music_app/src/pages/login/widgets/register_form.dart';

import './widgets/custom_widgets.dart';
import 'package:flutter_app_music_app/src/utils/responsive.dart';
import 'package:flutter_app_music_app/src/utils/services.dart';

class LoginFormType {
  static final int login = 0;
  static final int register = 1;
  static final int forgotPassword = 2;
}

class LoginPage extends StatefulWidget {
  static final String routeName = 'login';
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with AfterLayoutMixin {
  PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _switchForm(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    final bool isTable = MediaQuery.of(context).size.shortestSide >= 600;
    if (!isTable) {
      contraintsOrientationUp();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () => focus(context),
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              if (orientation == Orientation.portrait) {
                return SingleChildScrollView(
                  child: Container(
                    height: responsive.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Welcome(),
                        Expanded(
                          child: PageView(
                            physics: NeverScrollableScrollPhysics(),
                            controller: _pageController,
                            children: [
                              LoginForm(
                                onGoToRegister: () => _switchForm(
                                  LoginFormType.register,
                                ),
                                onGoToForgotPassword: () => _switchForm(
                                  LoginFormType.forgotPassword,
                                ),
                              ),
                              RegisterForm(
                                onGoToLogin: () => _switchForm(
                                  LoginFormType.login,
                                ),
                              ),
                              ForgotPasswordForm(
                                onGoToLogin: () => _switchForm(
                                  LoginFormType.login,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }

              return Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Container(
                        height: responsive.height,
                        child: Center(
                          child: Welcome(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        height: responsive.height,
                        child: Center(
                          child: LoginForm(
                            onGoToRegister: () => _switchForm(
                              LoginFormType.register,
                            ),
                            onGoToForgotPassword: () => _switchForm(
                              LoginFormType.forgotPassword,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
