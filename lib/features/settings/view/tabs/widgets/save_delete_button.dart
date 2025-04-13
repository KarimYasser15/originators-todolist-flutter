import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/core/utils/colors_manager.dart';
import 'package:todo_list/core/utils/strings_manager.dart';

class SaveDeleteButton extends StatelessWidget {
  SaveDeleteButton({super.key, required this.isSave});
  bool isSave;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: isSave ? ColorsManager.choosenColor : Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
              side: BorderSide(color: ColorsManager.choosenColor))),
      child: Text(
        isSave ? StringsManager.saveChanges : StringsManager.deleteAccount,
        style: AppStyles.bodyRegular(
            color: isSave ? Colors.white : ColorsManager.choosenColor),
      ),
    );
  }
}
