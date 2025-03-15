import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/core/utils/assets_manager.dart';
import 'package:todo_list/core/utils/messages.dart';
import 'package:todo_list/core/utils/validators.dart';
import 'package:todo_list/core/widgets/default_submit_button.dart';
import 'package:todo_list/core/widgets/default_text_form_field.dart';
import 'package:todo_list/features/tasks/view_model/tasks_view_model.dart';

class AddTaskBottomSheetWidget extends StatefulWidget {
  AddTaskBottomSheetWidget({super.key, required this.viewModel});
  TasksViewModel viewModel;

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
                    iconPath: AssetsManager.userIcon,
                    validator: (name) => Validators.validateTask(
                        name, Messages.taskNameRequired)),
                SizedBox(
                  height: 15.h,
                ),
                DefaultTextFormField(
                    hintText: "Task Description",
                    iconPath: AssetsManager.userIcon,
                    controller: taskDescription,
                    validator: (description) => Validators.validateTask(
                        description, Messages.taskDescriptionRequired)),
                SizedBox(
                  height: 30.h,
                ),
                DefaultSubmitButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await widget.viewModel
                            .addTask(taskName.text, taskDescription.text);
                        Navigator.pop(context);
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
}
