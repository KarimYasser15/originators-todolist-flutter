import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    viewModel.getAllTasks();
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<TasksViewModel>(builder: (context, viewModel, child) {
        if (viewModel.errorMessage != null) {
          return Center(
            child: Text(viewModel.errorMessage.toString()),
          );
        } else if (viewModel.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
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
            floatingActionButton: FloatingActionButton(
                backgroundColor:
                    viewModel.isTasksSelected ? Colors.red : Colors.blue,
                child: Icon(
                  viewModel.isTasksSelected ? Icons.delete : Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  viewModel.isTasksSelected
                      ? viewModel.deleteAllOrMany()
                      : showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (_) => AddTaskBottomSheetWidget(
                            viewModel: viewModel,
                          ),
                        );
                }),
          );
        }
      }),
    );
  }
}
