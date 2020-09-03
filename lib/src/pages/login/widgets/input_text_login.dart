import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_music_app/src/utils/app_colors.dart';
import 'package:flutter_svg/svg.dart';

class InputTextLogin extends StatefulWidget {
  final String iconPath;
  final String placeholder;
  final String initValue;
  final bool isSecure;
  final TextInputType keyInputType;
  final bool Function(String value) validator;

  const InputTextLogin({
    Key key,
    @required this.iconPath,
    @required this.placeholder,
    this.validator,
    this.initValue = '',
    this.isSecure = false,
    this.keyInputType = TextInputType.text,
  }) : super(key: key);

  @override
  InputTextLoginState createState() => InputTextLoginState();
}

class InputTextLoginState extends State<InputTextLogin> {
  bool _validationOk = false;
  TextEditingController _controller;

  bool get isOk => this._validationOk;
  String get value => _controller.text;

  void checkoutValidation() {
    if (widget.validator != null) {
      final bool isOk = widget.validator(_controller.text);
      if (_validationOk != isOk) {
        setState(() {
          _validationOk = isOk;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initValue);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: _controller,
      padding: EdgeInsets.all(10),
      keyboardType: widget.keyInputType,
      onChanged: (value) => checkoutValidation(),
      prefix: Container(
        width: 40,
        height: 30,
        padding: EdgeInsets.all(2),
        child: SvgPicture.asset(
          this.widget.iconPath,
          color: Color(0xffcccccc),
        ),
      ),
      suffix: this.widget.validator != null
          ? Icon(
              Icons.check_circle,
              color: _validationOk ? AppColors.primary : Colors.black12,
            )
          : null,
      obscureText: widget.isSecure,
      placeholder: this.widget.placeholder,
      style: TextStyle(fontFamily: 'sans'),
      placeholderStyle: TextStyle(fontFamily: 'sans', color: Color(0xffcccccc)),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffdddddd),
            width: 1,
          ),
        ),
      ),
    );
  }
}
