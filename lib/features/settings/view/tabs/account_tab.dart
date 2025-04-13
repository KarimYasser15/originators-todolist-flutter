import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/core/utils/assets_manager.dart';
import 'package:todo_list/core/utils/colors_manager.dart';
import 'package:todo_list/core/utils/strings_manager.dart';
import 'package:todo_list/features/settings/view/tabs/widgets/profile_details.dart';
import 'package:todo_list/features/settings/view/tabs/widgets/save_delete_button.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringsManager.photo,
            style: AppStyles.h4MediumDMSans(color: ColorsManager.black),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundColor: ColorsManager.choosenColor,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AssetsManager.editIcon)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Courtney Henry",
                    style: AppStyles.h5RegularDMSans(),
                  ),
                  Text(
                    "Courtney.Henry@example.com",
                    style: AppStyles.b1RegularDMSans(),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            StringsManager.profileInformation,
            style: AppStyles.h4MediumDMSans(color: ColorsManager.black),
          ),
          SizedBox(
            height: 10.h,
          ),
          ProfileDetails(
              label: StringsManager.userName, details: "Courtney Henry"),
          ProfileDetails(
              label: StringsManager.fullName, details: "Courtney Henry George"),
          ProfileDetails(
              label: StringsManager.email, details: "Courtney.Henry@gmail.com"),
          ProfileDetails(
              label: StringsManager.password, details: "Courtneyhenry12345"),
          ProfileDetails(
              label: StringsManager.phoneNumber, details: "+20123456789"),
          ProfileDetails(
              label: StringsManager.location, details: "Cairo, Egypt"),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SaveDeleteButton(isSave: true),
              Spacer(),
              SaveDeleteButton(isSave: false),
            ],
          ))
        ],
      ),
    );
  }
}
