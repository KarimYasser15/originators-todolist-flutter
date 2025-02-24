import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/screens/home/task_provider.dart';
import 'package:todo_list/screens/home/widget/add_task_bottom_sheet_widget.dart';
import 'package:todo_list/screens/home/widget/task_item_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  bool firstTimeToGetTasks = true;

  @override
  Widget build(BuildContext context) {
    TaskProvider taskProvider = Provider.of<TaskProvider>(context);
    if (firstTimeToGetTasks) {
      firstTimeToGetTasks = false;
      taskProvider.getAllTasks();
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Home Screen",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
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
      body: Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return TaskItemWidget();
          },
          itemCount: 3,
          padding: EdgeInsets.only(top: 20),
        ),
      ),
    );
  }
}
