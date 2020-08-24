import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;

  const RoundedButton({Key key, @required this.onPress, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        child: Text(
          this.title,
          style: TextStyle(
            fontFamily: 'sans',
            letterSpacing: 1,
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black26, blurRadius: 5)
          ],
        ),
      ),
      onPressed: this.onPress,
    );
  }
}
