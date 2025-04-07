import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/config/routes_manager.dart';
import 'package:todo_list/core/utils/assets_manager.dart';
import 'package:todo_list/core/utils/colors_manager.dart';
import 'package:todo_list/core/utils/strings_manager.dart';
import 'package:todo_list/features/tasks/data/models/get_all_todos_response/create_get_todos_response.dart';
import 'package:todo_list/features/tasks/view/widget/invite_button.dart';
import 'package:todo_list/features/tasks/view/widget/tag_item.dart';
import 'package:todo_list/features/tasks/view_model/tasks_view_model.dart';

class TaskItemWidget extends StatefulWidget {
  TaskItemWidget({super.key, required this.task, required this.tasksSelected});
  CreateGetTodosResponse task;
  Function(int taskId, bool isTaskSelected) tasksSelected;

  @override
  State<TaskItemWidget> createState() => _TaskItemWidgetState();
}

late TasksViewModel viewModel;

class _TaskItemWidgetState extends State<TaskItemWidget> {
  Color selectedColor = Colors.grey;
  bool deleteTask = false;
  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<TasksViewModel>(context, listen: false);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor:
              deleteTask ? ColorsManager.neutralGrey6 : Colors.white,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
              side: BorderSide(
                  color: deleteTask
                      ? ColorsManager.neutralGrey6
                      : ColorsManager.neutralGrey4)),
          elevation: 2),
      onLongPress: () => selectTasks(),
      onPressed: () => Navigator.pushNamed(context, RoutesManager.updateTask,
          arguments: {"task": widget.task}).then(
        (value) => viewModel.getAllTodos(),
      ),
      child: SizedBox(
        // width: double.infinity,
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
                    widget.task.title!,
                    // "Online Meeting",
                    style: AppStyles.h4MediumDMSans(color: ColorsManager.black),
                  ),
                  Spacer(),
                  IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: () {},
                      hoverColor: Colors.white,
                      icon: SvgPicture.asset(AssetsManager.shareIcon)),
                  PopupMenuButton<String>(
                    // icon: SvgPicture.asset(AssetsManager.moreIcon),
                    // onSelected: (String result) {
                    //   print(
                    //       result); // Handle what happens when an item is selected
                    // },
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
                        value: 'in-progress',
                        child: Text(StringsManager.inProgress),
                        onTap: () => viewModel.updateTodoStatus(
                            widget.task.customId!, "in-progress"),
                      ),
                      PopupMenuItem<String>(
                        value: 'completed',
                        child: Text(StringsManager.complete),
                        onTap: () => viewModel.updateTodoStatus(
                            widget.task.customId!, "completed"),
                      ),
                      PopupMenuItem<String>(
                        value: 'todo',
                        child: Text(StringsManager.todo),
                        onTap: () => viewModel.updateTodoStatus(
                            widget.task.customId!, "todo"),
                      ),
                      PopupMenuItem<String>(
                        value: 'Delete',
                        child: Text(StringsManager.delete),
                      ),
                    ],
                  ),
                  // IconButton(
                  //     visualDensity: VisualDensity.compact,
                  //     onPressed: () {},
                  //     hoverColor: Colors.white,
                  //     icon: SvgPicture.asset(AssetsManager.moreIcon)),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                widget.task.description!,
                // "ADSFASDFSADFSADFASDFASDFSDMDFGASDFASDFADSFADSFSDFADSVMERWORDSFWERGWERGEWRGEWGRWERGWERGREWGEWR"
                //     .toLowerCase(),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: AppStyles.h5RegularDMSans(
                    color: ColorsManager.neutralGrey8),
              ),
              SizedBox(
                height: 10.h,
              ),
              InviteButton(),
              // InkWell(
              //   child: Icon(
              //     Icons.delete,
              //     color: Colors.red,
              //   ),
              //   // onTap: () {
              //   //   viewModel.deleteTask(widget.task.customId!);
              //   // },
              // ),
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
                progressColor: ColorsManager.choosenColor,
              ),
              // SizedBox(
              //   height: 10.h,
              // ),
              SizedBox(
                width: double.infinity,
                height: 60.h,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8.w,
                      childAspectRatio: 1),
                  itemBuilder: (context, index) => Center(child: TagItem()),
                  itemCount: 20,
                ),
              ),
              // TagItem(),
            ],
          ),
        ),
      ),
    );
  }

  double progressIndicator() {
    if (widget.task.status == "in-progress") {
      return 0.5;
    } else if (widget.task.status == "completed") {
      return 1;
    }
    return 0;
  }

  void selectTasks() {
    setState(() {
      if (!deleteTask) {
        deleteTask = true;
        widget.tasksSelected(widget.task.customId!, deleteTask);
      } else {
        deleteTask = false;
        widget.tasksSelected(widget.task.customId!, deleteTask);
      }
    });
  }
}
