import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/core/utils/colors_manager.dart';

class ProfileDetails extends StatelessWidget {
  ProfileDetails({super.key, required this.label, required this.details});
  String label;
  String details;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.h5RegularDMSans(),
        ),
        Text(
          details,
          style: AppStyles.h5RegularDMSans(color: ColorsManager.choosenColor),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
