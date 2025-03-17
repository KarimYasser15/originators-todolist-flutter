import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/core/utils/assets_manager.dart';
import 'package:todo_list/core/utils/colors_manager.dart';
import 'package:todo_list/core/utils/strings_manager.dart';

class InviteButton extends StatelessWidget {
  const InviteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            backgroundColor: ColorsManager.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)),
          ),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AssetsManager.plusCircleIcon),
              SizedBox(
                width: 9.w,
              ),
              Text(
                StringsManager.invite,
                style: AppStyles.bodyRegular(),
              ),
            ],
          )),
    );
  }
}
