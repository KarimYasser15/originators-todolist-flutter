import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/core/utils/colors_manager.dart';

class FacebookGoogleItem extends StatelessWidget {
  FacebookGoogleItem(
      {super.key,
      required this.label,
      required this.iconLabel,
      required this.borderColor,
      required this.onPressed});
  String label;
  String iconLabel;
  Color borderColor;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            overlayColor: ColorsManager.choosenColor,
            padding: EdgeInsets.zero,
            fixedSize: Size(150.w, 48.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
                side: BorderSide(color: borderColor))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconLabel,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 5.w)),
            Text(
              label,
              style: AppStyles.h5MediumDMSans(),
            ),
          ],
        ));
  }
}
