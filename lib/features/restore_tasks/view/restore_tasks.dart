import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/core/widgets/circular_loading.dart';
import 'package:todo_list/features/tasks/view/widget/task_item_widget.dart';
import 'package:todo_list/features/tasks/view_model/tasks_view_model.dart';

class RestoreTasksScreen extends StatefulWidget {
  const RestoreTasksScreen({super.key});

  @override
  State<RestoreTasksScreen> createState() => _RestoreTasksScreenState();
}

class _RestoreTasksScreenState extends State<RestoreTasksScreen> {
  final viewModel = TasksViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.getAllTodos();
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<TasksViewModel>(
        builder: (context, value, child) {
          if (viewModel.errorMessage != null) {
            return Center(
              child: Text(viewModel.errorMessage.toString()),
            );
          } else if (viewModel.isLoading) {
            return Center(
              child: CircularLoading(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text("Restore"),
            ),
            body: ListView.builder(
              itemBuilder: (context, index) => TaskItemWidget(
                task: viewModel.tasks[index],
                tasksSelected: viewModel.selectTask,
              ),
            ),
          );
        },
      ),
    );
  }
}
