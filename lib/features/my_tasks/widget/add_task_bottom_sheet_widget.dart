import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/core/widgets/default_submit_button.dart';
import 'package:todo_list/core/widgets/default_text_form_field.dart';
import 'package:todo_list/features/my_tasks/models/create_task_response/CreateTaskResponse.dart';
import 'package:todo_list/features/my_tasks/providers/task_provider.dart';
import 'package:todo_list/features/my_tasks/services/tasks_api_manager.dart';

class AddTaskBottomSheetWidget extends StatefulWidget {
  AddTaskBottomSheetWidget({super.key});

  @override
  State<AddTaskBottomSheetWidget> createState() =>
      _AddTaskBottomSheetWidgetState();
}

class _AddTaskBottomSheetWidgetState extends State<AddTaskBottomSheetWidget> {
  TextEditingController taskName = TextEditingController();

  TextEditingController taskDescription = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 300.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20.r), right: Radius.circular(20.r))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                DefaultTextFormField(
                  hintText: "Task Name",
                  controller: taskName,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter task name";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                DefaultTextFormField(
                  hintText: "Task Description",
                  controller: taskDescription,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter task description";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                DefaultSubmitButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        addTask();
                      }
                    },
                    label: "Add Task")
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addTask() async {
    await TasksApiManager.createTask(taskName.text).then(
      (value) {
        Navigator.of(context).pop();
        Provider.of<TaskProvider>(context, listen: false).getAllTasks();
      },
    );
  }
}
