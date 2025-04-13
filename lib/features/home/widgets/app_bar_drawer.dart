import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/core/utils/assets_manager.dart';
import 'package:todo_list/core/utils/colors_manager.dart';
import 'package:todo_list/core/utils/strings_manager.dart';
import 'package:todo_list/features/home/widgets/drawer_elevated_button.dart';

enum DrawerItem { settings, profile, friends, trash }

class AppBarDrawer extends StatelessWidget {
  AppBarDrawer({super.key, required this.onDrawerItemClicked});
  void Function(DrawerItem) onDrawerItemClicked;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            children: [
              Column(
                children: [
                  Image.asset(
                    AssetsManager.appLogo,
                    height: 160.h,
                    // fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 50.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsManager.choosenColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r))),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(AssetsManager.myTrackers),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              StringsManager.myTrackers,
                              style:
                                  AppStyles.h5MediumDMSans(color: Colors.white),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_drop_up,
                              color: Colors.white,
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DrawerElevatedButton(
                    label: StringsManager.profile,
                    icon: SvgPicture.asset(AssetsManager.userIcon),
                    onPressed: () => onDrawerItemClicked(DrawerItem.profile),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DrawerElevatedButton(
                    label: StringsManager.friends,
                    icon: SvgPicture.asset(AssetsManager.multiUsers),
                    onPressed: () => onDrawerItemClicked(DrawerItem.friends),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DrawerElevatedButton(
                    label: StringsManager.trash,
                    icon: SvgPicture.asset(AssetsManager.trash),
                    onPressed: () => onDrawerItemClicked(DrawerItem.trash),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DrawerElevatedButton(
                    label: StringsManager.settings,
                    icon: SvgPicture.asset(AssetsManager.settings),
                    onPressed: () => onDrawerItemClicked(DrawerItem.settings),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
