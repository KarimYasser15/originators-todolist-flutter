import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/core/utils/colors_manager.dart';

class DefaultTextFormField extends StatelessWidget {
  String hintText;
  String? Function(String?)? validator;
  TextEditingController? controller;
  TextInputType? keyboardType;
  String? iconPath;

  DefaultTextFormField(
      {required this.hintText,
      required this.controller,
      this.validator,
      required this.iconPath,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyles.h5RegularDMSans(),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles.h5RegularRoboto,
        contentPadding: EdgeInsets.symmetric(vertical: 10),
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
        prefixIcon: iconPath != null
            ? SvgPicture.asset(
                iconPath!,
                fit: BoxFit.scaleDown,
              )
            : null,
      ),
      controller: controller,
      validator: validator,
    );
  }
}
