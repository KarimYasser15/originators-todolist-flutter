import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/features/my_tasks/models/get_all_todo_response/GetAllTodosResponse.dart';
import 'package:todo_list/features/my_tasks/providers/task_provider.dart';
import 'package:todo_list/features/my_tasks/services/tasks_api_manager.dart';
import 'package:todo_list/models/task_model.dart';
import 'package:todo_list/features/my_tasks/widget/add_task_bottom_sheet_widget.dart';
import 'package:todo_list/features/my_tasks/widget/task_item_widget.dart';

class TasksTab extends StatelessWidget {
  TasksTab({super.key});
  bool firstTimeToGetTasks = true;

  @override
  Widget build(BuildContext context) {
    TaskProvider taskProvider = Provider.of<TaskProvider>(context);
    if (firstTimeToGetTasks) {
      taskProvider.getAllTasks();
      firstTimeToGetTasks = false;
    }
    if (taskProvider.tasks.isEmpty) {
      return Text("No Tasks Found");
    } else {
      return Scaffold(
        body: Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TaskItemWidget(
                task: taskProvider.tasks[index],
              );
            },
            itemCount: taskProvider.tasks.length,
            padding: EdgeInsets.only(top: 20),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () => showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => AddTaskBottomSheetWidget(),
          ),
        ),
      );
    }
  }
}
