import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/config/app_styles.dart';

class DefaultSubmitButton extends StatelessWidget {
  DefaultSubmitButton({required this.onPressed, required this.label});

  String label;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, fixedSize: Size(255.w, 55.h)),
        child: Text(label, style: AppStyles.buttonTextStyle));
  }
}
