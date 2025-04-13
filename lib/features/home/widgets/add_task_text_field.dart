import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/core/utils/colors_manager.dart';

class AddTaskTextField extends StatefulWidget {
  String hintText;

  String? Function(String?)? validator;
  TextEditingController? controller;

  AddTaskTextField({
    required this.hintText,
    required this.controller,
    this.validator,
  });

  @override
  State<AddTaskTextField> createState() => _AddTaskTextFieldState();
}

class _AddTaskTextFieldState extends State<AddTaskTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyles.h5RegularDMSans(),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppStyles.h5RegularRoboto,
        contentPadding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.h),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: BorderSide(color: ColorsManager.neutralGrey6)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: BorderSide(color: ColorsManager.neutralGrey6)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: BorderSide(color: ColorsManager.neutralGrey6)),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.neutralGrey6),
          borderRadius: BorderRadius.circular(6.r),
        ),
      ),
      maxLines: null,
      controller: widget.controller,
      validator: widget.validator,
    );
  }
}
