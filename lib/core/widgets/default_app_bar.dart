import 'package:flutter/material.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/core/utils/colors_manager.dart';

class DefaultAppBar extends StatelessWidget {
  DefaultAppBar({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: AppStyles.h4MediumDMSans(color: ColorsManager.black)),
      titleSpacing: 0,
    );
  }
}
