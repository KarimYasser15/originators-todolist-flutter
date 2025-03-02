import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/features/my_tasks/view_model/tasks_view_model.dart';
import 'package:todo_list/features/my_tasks/view/widget/add_task_bottom_sheet_widget.dart';
import 'package:todo_list/features/my_tasks/view/widget/task_item_widget.dart';

class TasksTab extends StatefulWidget {
  TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  bool firstTimeToGetTasks = true;
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
                      );
                    },
                    itemCount: viewModel.tasks.length,
                    padding: EdgeInsets.only(top: 20),
                  ),
                );
              }),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () => showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (_) => AddTaskBottomSheetWidget(
                    viewModel: viewModel,
                  ),
                ),
              ),
            );
          }
        }));
  }
}
