import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/config/routes_manager.dart';
import 'package:todo_list/core/utils/messages.dart';
import 'package:todo_list/core/widgets/circular_loading.dart';
import 'package:todo_list/features/tasks/view_model/tasks_view_model.dart';
import 'package:todo_list/features/tasks/view/widget/add_task_bottom_sheet_widget.dart';
import 'package:todo_list/features/tasks/view/widget/task_item_widget.dart';

class TasksTab extends StatefulWidget {
  TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  final viewModel = TasksViewModel();

  // @override
  // void initState() {
  //   super.initState();
  //   viewModel.getAllTasks();
  // }

  @override
  Widget build(BuildContext context) {
    viewModel.getAllTodos();
    return Consumer<TasksViewModel>(builder: (context, viewModel, child) {
      if (viewModel.errorMessage != null) {
        // if (viewModel.errorMessage ==
        //     Exception(Messages.unAuthorizedUser).toString()) {
        //   WidgetsBinding.instance.addPostFrameCallback((_) {
        //     Navigator.pushReplacementNamed(context, RoutesManager.login);
        //   });
        // }
        return Center(
          child: Text(viewModel.errorMessage.toString()),
        );
      } else if (viewModel.isLoading) {
        return Center(
          child: CircularLoading(),
        );
      } else {
        return Scaffold(
          body: Builder(builder: (context) {
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return TaskItemWidget(
                    task: viewModel.tasks[index],
                    tasksSelected: viewModel.selectTask,
                  );
                },
                itemCount: viewModel.tasks.length,
                padding: EdgeInsets.only(top: 20),
              ),
            );
          }),
        );
      }
    });
  }
}
