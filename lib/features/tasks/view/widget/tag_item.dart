import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/core/utils/colors_manager.dart';

class TagItem extends StatelessWidget {
  TagItem({super.key, required this.isTrash});
  bool isTrash;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isTrash ? ColorsManager.neutralGrey6 : ColorsManager.lightRed,
          borderRadius: BorderRadius.circular(4.r)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          "online".toUpperCase(),
          style: AppStyles.b2RegularDMSans(),
        ),
      ),
    );
  }
}
