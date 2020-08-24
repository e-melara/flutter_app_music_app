import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;

void customThemeLigth() {
  services.SystemChrome.setSystemUIOverlayStyle(
    services.SystemUiOverlayStyle.light,
  );
}

void customThemeDark() {
  services.SystemChrome.setSystemUIOverlayStyle(
    services.SystemUiOverlayStyle.dark,
  );
}

void focus(BuildContext context) {
  FocusScope.of(context).unfocus();
}

void contraintsOrientationUp() {
  services.SystemChrome.setPreferredOrientations(
    [services.DeviceOrientation.portraitUp],
  );
}
