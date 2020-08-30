import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_music_app/src/utils/app_colors.dart';
import 'package:flutter_svg/svg.dart';

class CircleButton extends StatelessWidget {
  final String iconPath;
  final double size;
  final Color backgroundColor;
  final VoidCallback onPress;

  const CircleButton({
    Key key,
    @required this.iconPath,
    @required this.onPress,
    this.size = 50,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: this.onPress,
      child: Container(
        width: this.size,
        height: this.size,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: this.backgroundColor ?? AppColors.primary,
        ),
        child: SvgPicture.asset(this.iconPath, color: Colors.white),
      ),
    );
  }
}
