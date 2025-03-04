import 'package:flutter/material.dart';
import 'package:todo_list/features/my_tasks/data/models/get_all_todos_response/get_all_todos_response.dart';
import 'package:todo_list/core/widgets/default_submit_button.dart';
import 'package:todo_list/core/widgets/default_text_form_field.dart';
import 'package:todo_list/features/my_tasks/view_model/tasks_view_model.dart';

class UpdateTaskScreen extends StatelessWidget {
  UpdateTaskScreen({super.key, required this.task});
  GetAllTodosResponse task;
  late TextEditingController taskNameController =
      TextEditingController(text: task.title);
  late TextEditingController taskDescriptionController =
      TextEditingController(text: task.description);
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TasksViewModel viewModel = TasksViewModel();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Update Task",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: Form(
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
              ),
              SizedBox(
                height: 10,
              ),
              DefaultTextFormField(
                hintText: task.description!,
                controller: taskDescriptionController,
              ),
              SizedBox(
                height: 20,
              ),
              DefaultSubmitButton(
                  onPressed: () async {
                    await viewModel.updateTask(
                        task.id!,
                        taskNameController.text,
                        taskDescriptionController.text);
                    Navigator.pop(context);
                  },
                  label: "Update Task"),
            ],
          ),
        ),
      ),
    );
  }
}
