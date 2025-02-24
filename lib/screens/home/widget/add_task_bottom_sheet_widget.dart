import 'package:flutter/material.dart';
import 'package:todo_list/widgets/default_submit_button.dart';
import 'package:todo_list/widgets/default_text_form_field.dart';

class AddTaskBottomSheetWidget extends StatelessWidget {
  AddTaskBottomSheetWidget({super.key});
  TextEditingController taskName = TextEditingController();
  TextEditingController taskDescription = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(15), right: Radius.circular(15))),
      height: 300,
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
                height: 15,
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
                height: 30,
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
    );
  }

  void addTask() {}
}
