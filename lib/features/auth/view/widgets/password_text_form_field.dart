import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/core/utils/colors_manager.dart';

class PasswordTextFormField extends StatefulWidget {
  String hintText;

  String? Function(String?)? validator;
  TextEditingController? controller;

  PasswordTextFormField({
    required this.hintText,
    required this.controller,
    this.validator,
  });

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool visible = true;

  Icon visibilityIcon = Icon(Icons.visibility_off_outlined);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyles.h5RegularDMSans(),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppStyles.h5RegularRoboto,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
        suffixIcon: IconButton(
          icon: visibilityIcon,
          onPressed: () {
            if (visible) {
              setState(() {
                visible = false;
                visibilityIcon = Icon(Icons.visibility_outlined);
              });
            } else {
              setState(() {
                visible = true;
                visibilityIcon = Icon(Icons.visibility_off_outlined);
              });
            }
          },
        ),
      ),
      obscureText: visible,
      controller: widget.controller,
      validator: widget.validator,
    );
  }
}
