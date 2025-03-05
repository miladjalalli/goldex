import 'package:flutter/cupertino.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  static double scaleWidth(double size) {
    return (size / 428) * screenWidth;
  }

  static double scaleHeight(double size) {
    return (size / 926) * screenHeight;
  }
}