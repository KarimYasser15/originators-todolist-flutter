import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/widgets/default_submit_button.dart';
import 'package:todo_list/widgets/default_text_form_field.dart';

class AddTaskBottomSheetWidget extends StatelessWidget {
  AddTaskBottomSheetWidget({super.key});
  TextEditingController taskName = TextEditingController();
  TextEditingController taskDescription = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20.r), right: Radius.circular(20.r))),
        height: 300.h,
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

  void addTask() {}
}
