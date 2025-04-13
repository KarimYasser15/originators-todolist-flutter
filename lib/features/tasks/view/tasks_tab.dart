import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/core/utils/assets_manager.dart';
import 'package:todo_list/core/utils/colors_manager.dart';
import 'package:todo_list/core/widgets/circular_loading.dart';
import 'package:todo_list/features/tasks/view_model/tasks_view_model.dart';
import 'package:todo_list/features/tasks/view/widget/task_item_widget.dart';

class TasksTab extends StatefulWidget {
  TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<TasksViewModel>(context, listen: false);
    viewModel.getAllTodos();
  }

  @override
  Widget build(BuildContext context) {
    // viewModel.getAllTodos();
    return Consumer<TasksViewModel>(builder: (context, viewModel, child) {
      if (viewModel.errorMessage != null) {
        // if (viewModel.errorMessage ==
        //     Exception(Messages.unAuthorizedUser).toString()) {
        //   WidgetsBinding.instance.addPostFrameCallback((_) {
        //     Navigator.pushReplacementNamed(context, RoutesManager.login);
        //   });
        // }
        return Scaffold(
            body: RawScrollbar(
          radius: Radius.circular(20.r),
          thumbColor: ColorsManager.choosenColor,
          thickness: 4,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "My Trackers",
                      style:
                          AppStyles.h4MediumDMSans(color: ColorsManager.black),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(AssetsManager.calenderIcon),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          "February, 2025",
                          style: AppStyles.b1MediumDMSans(
                              color: ColorsManager.neutralGrey8),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    // TaskItemWidget()
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      // primary: false,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: TaskItemWidget(
                            task: viewModel.tasks[index],
                            tasksSelected: viewModel.selectTask,
                          ),
                        );
                      },
                      itemCount: 10,
                      padding: EdgeInsets.only(bottom: 20.h),
                    )
                  ]),
            ),
          ),
        ));
      } else if (viewModel.isLoading) {
        return Center(
          child: CircularLoading(),
        );
      } else {
        return Scaffold(
            body: RawScrollbar(
          radius: Radius.circular(20.r),
          thumbColor: ColorsManager.choosenColor,
          thickness: 4,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "My Trackers",
                      style:
                          AppStyles.h4MediumDMSans(color: ColorsManager.black),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(AssetsManager.calenderIcon),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          "15January, 2025",
                          style: AppStyles.b1MediumDMSans(
                              color: ColorsManager.neutralGrey8),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    // TaskItemWidget()
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      // primary: false,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: TaskItemWidget(
                            task: viewModel.tasks[index],
                            tasksSelected: viewModel.selectTask,
                          ),
                        );
                      },
                      itemCount: viewModel.tasks.length,
                      padding: EdgeInsets.only(bottom: 20.h),
                    )
                  ]),
            ),
          ),
        ));
      }
    });
  }
}
