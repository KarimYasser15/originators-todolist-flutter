import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/config/routes_manager.dart';
import 'package:todo_list/core/utils/assets_manager.dart';
import 'package:todo_list/core/utils/messages.dart';
import 'package:todo_list/core/widgets/circular_loading.dart';
import 'package:todo_list/features/tasks/data/models/get_all_todos_response/create_get_todos_response.dart';
import 'package:todo_list/core/widgets/default_submit_button.dart';
import 'package:todo_list/core/widgets/default_text_form_field.dart';
import 'package:todo_list/features/tasks/view_model/tasks_view_model.dart';
import 'package:todo_list/features/update_task/view_model/update_view_model.dart';

class UpdateTaskScreen extends StatelessWidget {
  UpdateTaskScreen({
    super.key,
    required this.task,
  });
  CreateGetTodosResponse task;
  late TextEditingController taskNameController =
      TextEditingController(text: task.title);
  late TextEditingController taskDescriptionController =
      TextEditingController(text: task.description);
  var formKey = GlobalKey<FormState>();
  final viewModel = UpdateViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Update Task",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.white,
        body: Stack(children: [
          Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DefaultTextFormField(
                    hintText: task.title!,
                    controller: taskNameController,
                    iconPath: AssetsManager.userIcon,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DefaultTextFormField(
                    hintText: task.description!,
                    controller: taskDescriptionController,
                    iconPath: AssetsManager.userIcon,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DefaultSubmitButton(
                      onPressed: () async {
                        await viewModel.updateTodo(
                            task.customId!,
                            taskNameController.text,
                            taskDescriptionController.text);
                        if (viewModel.errorMessage ==
                            Exception(Messages.unAuthorizedUser).toString()) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            Navigator.pushReplacementNamed(
                                context, RoutesManager.login);
                          });
                        }
                        if (!viewModel.isLoading) {
                          Navigator.pop(context);
                        }
                      },
                      label: "Update Task"),
                ],
              ),
            ),
          ),
          viewModel.isLoading ? Center(child: CircularLoading()) : Container(),
        ]),
      ),
    );
  }
}
