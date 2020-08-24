import 'package:flutter/material.dart';
import 'dart:math' as Math;

class Responsive {
  final double width;
  final double height;
  final double inch;

  Responsive(this.width, this.height, this.inch);

  factory Responsive.of(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final Size size = mediaQueryData.size;
    final inch = Math.sqrt(Math.pow(size.width, 2) + Math.pow(size.height, 2));

    return Responsive(size.width, size.height, inch);
  }

  double wp(double percent) => this.width * percent / 100;
  double hp(double percent) => this.height * percent / 100;
  double ip(double percent) => this.inch * percent / 100;
}
