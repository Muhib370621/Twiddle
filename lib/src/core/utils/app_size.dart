import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppSize {
  late MediaQueryData queryData;
  //~~~~~~~~~~~~~~~~~~~~~~~~~Screen Size~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double statusBarHeight = 0.0;
  static double imageHeight = 0.0;
  static double imageWidth = 0.0;
  static double appBarHeight = 0.0;
  static double paddingAll = 0.0;
  static double paddingLeft = 0.0;
  static double contentPadding = 20.0;
  static double paddingTop = 0.0;
  static double paddingBottom = 0.0;
  static double paddingRight = 0.0;
  static double borderRadius = 0.0;
  static double buttonBorderRadius = 0.0;
  static double headSize = 0.0;
  static double textSize = 0.0;
  static double iconsize = 0.0;
  static double tapPadding = 0.0;
  static double borderWidth = 0.0;
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  void init(BuildContext context) {
    queryData = MediaQuery.of(context);

    //~~~~~~~~~~~~~~~~~~~~~~~~~Screen Size~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    screenWidth = queryData.size.width;
    screenHeight = queryData.size.height;
    statusBarHeight = kToolbarHeight;
    appBarHeight = kToolbarHeight;
    screenWidth = 100.w;
    screenHeight = 100.h;
    imageHeight = 17.w;
    imageWidth = 17.w;
    paddingAll = 4.w;
    paddingLeft = 2.w;
    contentPadding = 20.0;
    paddingRight = 2.w;
    paddingTop = 2.w;
    paddingBottom = 2.w;
    borderRadius = 2.w;
    buttonBorderRadius = 1.w;
    headSize = 24.sp;
    textSize = 11.sp;
    iconsize = 1.2.w * 1.2.h;
    tapPadding = 3;
    borderWidth = 1;
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  }
}