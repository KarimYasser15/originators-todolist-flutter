import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/core/utils/assets_manager.dart';
import 'package:todo_list/core/utils/colors_manager.dart';
import 'package:todo_list/core/utils/strings_manager.dart';

class FriendsItem extends StatelessWidget {
  FriendsItem({super.key, required this.userName});
  String userName;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          // top: 40.h,
          // bottom: 250.h,
          left: 0,
          right: 0,
          child: Card(
            margin: EdgeInsets.only(top: 40),
            color: ColorsManager.neutralGrey2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
                side: BorderSide(color: ColorsManager.neutralGrey4)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  userName,
                  style: AppStyles.b1MediumDMSans(),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text("Wade.warren@example.com",
                    overflow: TextOverflow.visible,
                    maxLines: 1,
                    style: AppStyles.b2RegularDMSans(
                        color: ColorsManager.neutralGrey9)),
                SizedBox(
                  height: 20.h,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // fixedSize: Size(200.w, 100.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r)),
                        backgroundColor: ColorsManager.choosenColor),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(AssetsManager.contact),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          StringsManager.contact,
                          style: AppStyles.b1MediumDMSans(color: Colors.white),
                        )
                      ],
                    )),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
        // Padding(padding: EdgeInsets.only(top: 40.h)),
        CircleAvatar(
          backgroundColor: ColorsManager.choosenColor,
          radius: 40.r,
        ),
      ],
    );
  }
}
