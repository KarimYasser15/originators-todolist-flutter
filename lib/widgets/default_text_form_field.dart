import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  String hintText;

  String? Function(String?)? validator;
  TextEditingController? controller;
  bool isPassword;

  DefaultTextFormField(
      {required this.hintText, required this.controller, this.validator, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText,),
      obscureText: isPassword,
      controller: controller,
      validator: validator,
    );
  }
}
