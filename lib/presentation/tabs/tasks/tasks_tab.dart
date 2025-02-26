import 'package:flutter/material.dart';
import 'package:todo_list/presentation/tabs/tasks/widget/add_task_bottom_sheet_widget.dart';
import 'package:todo_list/presentation/tabs/tasks/widget/task_item_widget.dart';

class TasksTab extends StatelessWidget {
  TasksTab({super.key});
  bool firstTimeToGetTasks = true;

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
            return TaskItemWidget();
          },
          itemCount: 3,
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
          isDismissible: true,
          context: context,
          builder: (context) => AddTaskBottomSheetWidget(),
        ),
      ),
    );
  }
}
