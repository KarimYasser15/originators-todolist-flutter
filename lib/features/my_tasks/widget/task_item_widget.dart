import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/config/routes_manager.dart';
import 'package:todo_list/features/my_tasks/models/get_all_todo_response/GetAllTodosResponse.dart';
import 'package:todo_list/features/my_tasks/providers/task_provider.dart';
import 'package:todo_list/features/my_tasks/services/tasks_api_manager.dart';
import 'package:todo_list/models/task_model.dart';

class TaskItemWidget extends StatefulWidget {
  TaskItemWidget({super.key, required this.task});
  GetAllTodosResponse task;

  @override
  State<TaskItemWidget> createState() => _TaskItemWidgetState();
}

class _TaskItemWidgetState extends State<TaskItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, RoutesManager.updateTask),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: widget.task.completed! ? Colors.blue : Colors.grey),
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
                        "No Description Yet",
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
                    deleteTask();
                    print("PRESSED");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void deleteTask() async {
    await TasksApiManager.deleteTodo(widget.task.id!).then(
      (value) {
        Provider.of<TaskProvider>(context, listen: false).getAllTasks();
      },
    );
  }
}
