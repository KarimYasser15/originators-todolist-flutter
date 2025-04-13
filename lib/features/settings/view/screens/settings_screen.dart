import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/core/utils/assets_manager.dart';
import 'package:todo_list/core/utils/colors_manager.dart';
import 'package:todo_list/core/utils/strings_manager.dart';
import 'package:todo_list/features/settings/view/tabs/account_tab.dart';
import 'package:todo_list/features/settings/view/tabs/theme_tab.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(140.h),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 40, left: 16, right: 16, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(AssetsManager.backButton),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Text(
                          StringsManager.settings,
                          style: AppStyles.h4MediumDMSans(color: Colors.black),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.r),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AssetsManager.bellIcon,
                            height: 25,
                          ),
                          SizedBox(width: 10.w),
                          CircleAvatar(
                            radius: 20.r,
                            backgroundColor: ColorsManager.choosenColor,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              TabBar(
                labelColor: ColorsManager.choosenColor,
                unselectedLabelColor: ColorsManager.black,
                indicatorColor: ColorsManager.choosenColor,
                labelStyle: AppStyles.b1MediumDMSans(),
                tabs: [
                  Tab(text: "Account"),
                  Tab(text: "Theme"),
                  Tab(text: "Notification"),
                ],
              )
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: TabBarView(
            children: [
              AccountTab(),
              ThemeTab(),
              Center(child: Text("Notification Settings")),
            ],
          ),
        ),
      ),
    );
  }
}
