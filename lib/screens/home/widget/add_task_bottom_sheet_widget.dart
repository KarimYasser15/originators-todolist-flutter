import 'package:flutter/material.dart';
import 'package:todo_list/widgets/default_submit_button.dart';
import 'package:todo_list/widgets/default_text_form_field.dart';

class AddTaskBottomSheetWidget extends StatelessWidget {
  AddTaskBottomSheetWidget({super.key});
  TextEditingController taskName = TextEditingController();
  TextEditingController taskDescription = TextEditingController();

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
        child: Column(
          children: [
            DefaultTextFormField(hintText: "Task Name", controller: taskName),
            SizedBox(
              height: 15,
            ),
            DefaultTextFormField(
                hintText: "Task Description", controller: taskDescription),
            SizedBox(
              height: 30,
            ),
            DefaultSubmitButton(onPressed: () {}, label: "Add Task")
          ],
        ),
      ),
    );
  }
}
