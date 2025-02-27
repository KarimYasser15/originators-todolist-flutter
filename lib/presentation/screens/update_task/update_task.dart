import 'package:flutter/material.dart';
import 'package:todo_list/config/routes_manager.dart';
import 'package:todo_list/models/task_model.dart';
import 'package:todo_list/core/widgets/default_submit_button.dart';
import 'package:todo_list/core/widgets/default_text_form_field.dart';

class UpdateTaskScreen extends StatelessWidget {
  UpdateTaskScreen({super.key});
  TaskModel? task;
  TextEditingController taskNameController =
      TextEditingController(text: "Get Task name from Model");
  TextEditingController taskDescriptionController =
      TextEditingController(text: "Get Task description from Model");
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                hintText: "Task Name",
                controller: taskNameController,
              ),
              SizedBox(
                height: 10,
              ),
              DefaultTextFormField(
                hintText: "Task Description",
                controller: taskDescriptionController,
              ),
              SizedBox(
                height: 20,
              ),
              DefaultSubmitButton(
                  onPressed: () {
                    updateTask();
                    Navigator.pop(context, RoutesManager.home);
                  },
                  label: "Update Task"),
            ],
          ),
        ),
      ),
    );
  }

  void updateTask() {}
}
