import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/core/utils/colors_manager.dart';

class DefaultSubmitButton extends StatelessWidget {
  DefaultSubmitButton({required this.onPressed, required this.label});

  String label;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      height: 48.h,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r)),
              backgroundColor: ColorsManager.choosenColor),
          child: Text(label,
              style:
                  AppStyles.h4MediumDMSans(color: ColorsManager.neutralGrey1))),
    );
  }
}
