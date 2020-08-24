import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app_music_app/src/utils/responsive.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 11,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            width: double.infinity,
            child: _Ilustrations(
              boxConstraints: constraints,
            ),
          );
        },
      ),
    );
  }
}

class _Ilustrations extends StatelessWidget {
  final BoxConstraints boxConstraints;
  const _Ilustrations({Key key, this.boxConstraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final line = Positioned(
      top: boxConstraints.maxHeight * 0.7,
      child: Column(
        children: <Widget>[
          Container(
            height: 3,
            color: Color(0xffeeeeee),
            width: boxConstraints.maxWidth,
          ),
          SizedBox(height: 20.0),
          Text(
            'Welcome Back!',
            style: TextStyle(
              fontFamily: 'raleway',
              fontSize: responsive.ip(2.5),
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );

    final woman = Positioned(
      top: boxConstraints.maxHeight * 0.285,
      left: 10,
      child: SvgPicture.asset(
        "assets/pages/login/woman.svg",
        width: boxConstraints.maxWidth * 0.35,
      ),
    );

    final man = Positioned(
      top: boxConstraints.maxHeight * 0.31,
      right: 10,
      child: SvgPicture.asset(
        "assets/pages/login/man.svg",
        width: boxConstraints.maxWidth * 0.26,
      ),
    );

    final clouds = Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SvgPicture.asset(
        "assets/pages/login/clouds.svg",
        width: boxConstraints.maxWidth,
        height: boxConstraints.maxHeight * 0.7,
      ),
    );
    return Stack(
      children: [
        line,
        clouds,
        woman,
        man,
      ],
    );
  }
}
