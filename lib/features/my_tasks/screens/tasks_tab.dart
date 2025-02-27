import 'package:flutter/material.dart';
import 'package:todo_list/models/task_model.dart';
import 'package:todo_list/features/my_tasks/widget/add_task_bottom_sheet_widget.dart';
import 'package:todo_list/features/my_tasks/widget/task_item_widget.dart';

class TasksTab extends StatelessWidget {
  TasksTab({super.key});
  bool firstTimeToGetTasks = true;
  List<TaskModel> tasks = [
    TaskModel(
        name: "Finish UI", description: "Finish todo app UI", status: true),
    TaskModel(
        name: "Finish Models",
        description: "Finish todo app models",
        status: true),
    TaskModel(
        name: "Finish integrating",
        description: "Finish todo app integrating",
        status: false),
    TaskModel(
        name: "Go Home",
        description: "Finish all above tasks and go home",
        status: false)
  ];

  @override
  Widget build(BuildContext context) {
    //TaskProvider taskProvider = Provider.of<TaskProvider>(context);
    if (firstTimeToGetTasks) {
      firstTimeToGetTasks = false;
      //taskProvider.getAllTasks();
    }
    return Scaffold(
      body: Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return TaskItemWidget(
              task: tasks[index],
            );
          },
          itemCount: tasks.length,
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
