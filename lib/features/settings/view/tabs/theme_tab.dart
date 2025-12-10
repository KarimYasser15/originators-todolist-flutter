import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/core/utils/colors_manager.dart';
import 'package:todo_list/core/utils/strings_manager.dart';
import 'package:todo_list/features/settings/data/models/theme_color.dart';

class ThemeTab extends StatefulWidget {
  ThemeTab({super.key});
  static List<ThemeColor> allColors = ThemeColor.colors;
  bool isLight = false;

  @override
  State<ThemeTab> createState() => _ThemeTabState();
}

class _ThemeTabState extends State<ThemeTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsManager.yourTheme,
          style: AppStyles.h5MediumDMSans(),
        ),
        SizedBox(
          height: 20.h,
        ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 10.w, mainAxisSpacing: 20.h),
          itemBuilder: (context, index) => ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ThemeTab.allColors[index].color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r)),
              ),
              onPressed: () {},
              child: Container()),
          itemCount: ThemeTab.allColors.length,
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              StringsManager.lightMode,
              style: AppStyles.h5MediumDMSans(),
            ),
            Switch(
                activeColor: Colors.white,
                activeTrackColor: ColorsManager.choosenColor,
                value: widget.isLight,
                onChanged: (value) {
                  widget.isLight = value;
                  setState(() {});
                })
          ],
        )
      ],
    );
  }
}
