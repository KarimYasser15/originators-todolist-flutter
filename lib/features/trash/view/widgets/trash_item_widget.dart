import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/core/utils/assets_manager.dart';
import 'package:todo_list/core/utils/colors_manager.dart';
import 'package:todo_list/core/utils/strings_manager.dart';
import 'package:todo_list/features/tasks/view/widget/invite_button.dart';
import 'package:todo_list/features/tasks/view/widget/tag_item.dart';
import 'package:todo_list/features/tasks/view_model/tasks_view_model.dart';

class TrashItemWidget extends StatefulWidget {
  TrashItemWidget({
    super.key,
  });
  // CreateGetTodosResponse task;
  // Function(int taskId, bool isTaskSelected) tasksSelected;

  @override
  State<TrashItemWidget> createState() => _TrashItemWidgetState();
}

late TasksViewModel viewModel;

class _TrashItemWidgetState extends State<TrashItemWidget> {
  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<TasksViewModel>(context);
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: ColorsManager.neutralGrey4)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 0,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Trash",
                  style: AppStyles.h4MediumDMSans(color: ColorsManager.black),
                ),
                Spacer(),
                IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: () {},
                    hoverColor: Colors.white,
                    icon: SvgPicture.asset(AssetsManager.shareIcon)),
                PopupMenuButton<String>(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r)),
                  borderRadius: BorderRadius.circular(10.r),
                  child: SvgPicture.asset(
                    AssetsManager.moreIcon,
                    // fit: BoxFit.fill,
                  ),
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'select',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.check_box,
                            color: ColorsManager.choosenColor,
                          ),
                          Text(
                            StringsManager.select,
                            style: AppStyles.bodyRegular(
                                color: ColorsManager.choosenColor),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    PopupMenuItem<String>(
                      value: 'delete',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(AssetsManager.trash),
                          Text(
                            StringsManager.delete,
                            style: AppStyles.bodyRegular(
                                color: ColorsManager.black),
                          )
                        ],
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "HELLO",
              // "ADSFASDFSADFSADFASDFASDFSDMDFGASDFASDFADSFADSFSDFADSVMERWORDSFWERGWERGEWRGEWGRWERGWERGREWGEWR"
              //     .toLowerCase(),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style:
                  AppStyles.h5RegularDMSans(color: ColorsManager.neutralGrey8),
            ),
            SizedBox(
              height: 10.h,
            ),
            InviteButton(),
            SizedBox(
              height: 10.h,
            ),
            LinearPercentIndicator(
              padding: EdgeInsets.zero,
              backgroundColor: ColorsManager.neutralGrey4,
              percent: progressIndicator(),
              animation: true,
              lineHeight: 8.h,
              barRadius: Radius.circular(100.r),
              trailing: Padding(
                padding: EdgeInsets.only(left: 8.0.w),
                child: Text(
                  "${(progressIndicator() * 100).toInt().toString()}%",
                  style: AppStyles.bodyRegular(color: ColorsManager.black),
                ),
              ),
              progressColor: ColorsManager.neutralGrey6,
            ),
            SizedBox(
              width: double.infinity,
              height: 60.h,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 8.w,
                    childAspectRatio: 1),
                itemBuilder: (context, index) => Center(
                    child: TagItem(
                  isTrash: true,
                )),
                itemCount: 20,
              ),
            ),
            // TagItem(),
          ],
        ),
      ),
    );
  }

  double progressIndicator() {
    // if (widget.task.status == "in_progress") {
    //   return 0.5;
    // } else if (widget.task.status == "completed") {
    //   return 1;
    // }
    return 0.5;
  }
}
