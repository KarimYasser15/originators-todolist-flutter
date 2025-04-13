import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/config/app_styles.dart';

class DrawerElevatedButton extends StatelessWidget {
  DrawerElevatedButton(
      {super.key,
      required this.label,
      required this.icon,
      required this.onPressed});
  String label;
  Widget icon;
  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              elevation: 0,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r))),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              icon,
              SizedBox(
                width: 10.w,
              ),
              Text(
                label,
                style: AppStyles.h5RegularDMSans(),
              ),
            ],
          )),
    );
  }
}
