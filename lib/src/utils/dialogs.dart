import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static void alert(
    BuildContext context, {
    String title,
    String description,
  }) {
    showDialog(
      context: context,
      child: CupertinoAlertDialog(
        title: title == null ? null : Text(title),
        content: description == null ? null : Text(description),
        actions: [
          CupertinoDialogAction(
            child: Text('Ok'),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}

class ProgressDialog {
  final BuildContext context;
  ProgressDialog(this.context);

  void show() {
    showCupertinoDialog(
      context: this.context,
      builder: (BuildContext context) => Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white.withOpacity(0.7),
        child: CupertinoActivityIndicator(
          radius: 15,
        ),
      ),
    );
  }

  void dismiss() {
    Navigator.pop(context);
  }
}
