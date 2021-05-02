import 'package:flutter/material.dart';

class Constants {
  static final StringsConstants _strings = StringsConstants();

  StringsConstants get strings => _strings;
}

class StringsConstants {
  static const costumeWasDeleted = 'costume was deleted';
  static const empty = '';
}

class ErrorCodeConstants {
  static const wrongPassword = "wrong-password";
  static const userNotFound = "user-not-found";
}

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

const textInputDecorator = InputDecoration(
  fillColor: MyColorTheme.inputDecoratorFillColor,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
        color: MyColorTheme.inputDecoratorEnabledBorderOutlineSideColor,
        width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
        color: MyColorTheme.inputDecoratorFocusedBorderOutlineSideColor,
        width: 2.0),
  ),
);

class InputField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final String? Function(String? val)? validator;
  final void Function(String val) onChanged;

  const InputField(
      {required this.hintText,
      this.obscureText = false,
      required this.validator,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: MyColorTheme.textFormFieldCursorColor,
      decoration: textInputDecorator.copyWith(hintText: hintText),
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
    );
  }
}
