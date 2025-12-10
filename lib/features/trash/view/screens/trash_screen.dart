import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/core/utils/assets_manager.dart';
import 'package:todo_list/core/utils/colors_manager.dart';
import 'package:todo_list/core/utils/strings_manager.dart';
import 'package:todo_list/features/trash/view/widgets/trash_item_widget.dart';

class TrashScreen extends StatefulWidget {
  const TrashScreen({super.key});

  @override
  State<TrashScreen> createState() => _TrashScreenState();
}

int selectedTodos = 0;

class _TrashScreenState extends State<TrashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsManager.neutralGrey6,
        onPressed: () {},
        child: SvgPicture.asset(AssetsManager.restoreTasks),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      appBar: AppBar(
        title: Text(
          StringsManager.trash,
          style: AppStyles.h4MediumDMSans(color: ColorsManager.black),
        ),
        titleSpacing: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.r),
            child: Container(
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
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18.w,
        ),
        child: Column(children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Text(
                StringsManager.trashedTrackersSelected,
                style: AppStyles.h5MediumDMSans(),
              ),
              Text(
                " ($selectedTodos)",
                style:
                    AppStyles.h5MediumDMSans(color: ColorsManager.neutralGrey6),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: ColorsManager.black,
                  ))
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          TrashItemWidget(),
        ]),
      )),
    );
  }
}
