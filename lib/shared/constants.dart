import 'package:digtial_costume_platform/presentation/core/theme.dart';
import 'package:flutter/material.dart';

class Constants {
  static final StringsConstants _strings = StringsConstants();

  StringsConstants get strings => _strings;
}

class StringsConstants {
  static const costumeWasDeleted = 'costume was deleted';
  static const empty = '';
  static const selectAProduction = "Select a production";
  static const signOut = "Sign Out";
  static const productions = "Productions";
  static const areYouSureYouWantToDeleteThisCostume = "Are you sure you want to delete this costume?";
  static const search = "Search";
  static const selectAListToAddCostumeTo = "Select one of your list to add the costume to";
  static const error = "Error";
  static const noMatchesFound = "Matches no available suggestions";
  static const category = "Category";
  static const timePeriod = "Time Period";
  static const productionTitle = "Production Title";

}

class ErrorCodeConstants {
  static const wrongPassword = "wrong-password";
  static const userNotFound = "user-not-found";
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
