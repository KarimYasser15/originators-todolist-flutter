import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextFormField extends StatelessWidget {
  String hintText;

  String? Function(String?)? validator;
  TextEditingController? controller;
  bool isPassword;

  DefaultTextFormField({
    required this.hintText,
    required this.controller,
    this.validator,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.blue,
      // decoration: InputDecoration(
      //     constraints: BoxConstraints(maxHeight: 60.h),
      //     hintText: hintText,
      //     focusedBorder: OutlineInputBorder(
      //         borderRadius: BorderRadius.circular(40.r),
      //         borderSide: BorderSide(color: Colors.blue)),
      //     border: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(40.r),
      //     )),
      obscureText: isPassword,
      controller: controller,
      validator: validator,
    );
  }
}
