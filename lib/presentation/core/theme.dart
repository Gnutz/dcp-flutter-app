import 'package:flutter/material.dart';

class ColorSwatch {
  static const blue = Color.fromRGBO(52, 69, 141, 1.0);
  static const deepBlue = Color.fromRGBO(26, 18, 57, 1.0);
  static const maroon = Color.fromRGBO(83, 41, 61, 1.0);
  static const brown = Color.fromRGBO(132, 77, 74, 1.0);
  static const beige = Color.fromRGBO(243, 192, 145, 1.0);
  static const white = Color.fromRGBO(247, 240, 234, 1.0);
  static const brown400 = Color.fromRGBO(73, 62, 59, 1.0);
  static const brown100 = Color.fromRGBO(215, 204, 200, 1.0);
  static const pink = Color.fromRGBO(233, 30, 99, 1.0);
  static const whiteTrue = Color.fromRGBO(255, 255, 255, 1.0);
}

class MyColorTheme {
  static const appBarBackgroundColor = ColorSwatch.deepBlue;
  static const backgroundColor = ColorSwatch.white;
  static const inputDecoratorFillColor = ColorSwatch.beige;
  static const inputDecoratorEnabledBorderOutlineSideColor = ColorSwatch.beige;
  static const inputDecoratorFocusedBorderOutlineSideColor = ColorSwatch.maroon;
  static const textFormFieldCursorColor = ColorSwatch.maroon;
  static const buttonTextColor = ColorSwatch.whiteTrue;
  static const buttonColor = ColorSwatch.blue;
}

//https://www.youtube.com/watch?v=ju1fr9C4g4U&t=661s

ThemeData basicTheme(){
  final base = ThemeData.light();

  return ThemeData.light().copyWith(
    primaryColor: ColorSwatch.deepBlue,
    scaffoldBackgroundColor: ColorSwatch.white,
    appBarTheme: base.appBarTheme.copyWith(
      backgroundColor: ColorSwatch.deepBlue
    ),
  );
}