import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/config/routes_manager.dart';
import 'package:todo_list/features/tasks/data/models/get_all_todos_response/create_get_todos_response.dart';
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
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        onLongPress: () => selectTasks(),
        onTap: () => Navigator.pushNamed(context, RoutesManager.updateTask,
            arguments: {"task": widget.task, "viewModel": viewModel}),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: deleteTask ? Colors.red : Colors.grey),
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20.r),
          //     color: widget.task.completed ? Colors.blue : Colors.grey),
          width: double.infinity,
          height: 120.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.task.title!,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        widget.task.description!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onTap: () {
                    viewModel.deleteTask(widget.task.customId!);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
