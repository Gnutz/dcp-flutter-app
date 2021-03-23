import 'package:flutter/material.dart';

const textInputDecorator = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink, width: 2.0),
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
      cursorColor: Colors.pink,
      decoration: textInputDecorator.copyWith(hintText: hintText),
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
    );
  }
}
