import 'package:flutter/material.dart';

class Demands {
  late MediaQueryData mediaQuery;
  late double screenWidth;
  late double screenHeight;
  late double aspectRatio;
  late double devicePixelRatio;
  late EdgeInsets padding;
  late EdgeInsets viewInsets;
  late bool isLandscape;
  late double textScaleFactor;

  Demands(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
    aspectRatio = mediaQuery.size.aspectRatio;
    devicePixelRatio = mediaQuery.devicePixelRatio;
    padding = mediaQuery.padding;
    viewInsets = mediaQuery.viewInsets;
    isLandscape = mediaQuery.orientation == Orientation.landscape;
    textScaleFactor = mediaQuery.textScaleFactor;
  }
}
