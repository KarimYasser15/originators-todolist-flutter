import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/core/utils/assets_manager.dart';
import 'package:todo_list/core/utils/colors_manager.dart';
import 'package:todo_list/core/utils/messages.dart';
import 'package:todo_list/core/utils/strings_manager.dart';
import 'package:todo_list/core/utils/validators.dart';
import 'package:todo_list/core/widgets/default_submit_button.dart';
import 'package:todo_list/core/widgets/default_text_form_field.dart';
import 'package:todo_list/features/home/widgets/add_task_text_field.dart';
import 'package:todo_list/features/tasks/view/widget/invite_button.dart';
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
  TextEditingController tags = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        // height: 300.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20.r), right: Radius.circular(20.r))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Create New Tracker",
                      style:
                          AppStyles.h4MediumDMSans(color: ColorsManager.black),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(AssetsManager.shareIcon)),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset(AssetsManager.closeIcon)),
                  ],
                ),
                Image.asset(
                  AssetsManager.addTaskImage,
                  // fit: BoxFit.fill,
                ),
                Row(
                  children: [
                    SvgPicture.asset(AssetsManager.addTitleIcon),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      StringsManager.trackerTitle,
                      style: AppStyles.b1MediumDMSans(),
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                AddTaskTextField(
                    hintText: "Task Name",
                    controller: taskName,
                    validator: (name) => Validators.validateTask(
                        name, Messages.taskNameRequired)),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(AssetsManager.descriptionIcon),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      StringsManager.description,
                      style: AppStyles.b1MediumDMSans(),
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                AddTaskTextField(
                    hintText: "Task Description",
                    controller: taskDescription,
                    validator: (description) => Validators.validateTask(
                        description, Messages.taskDescriptionRequired)),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(AssetsManager.calenderIcon),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      StringsManager.date,
                      style: AppStyles.b1MediumDMSans(),
                    )
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    // SvgPicture.asset(AssetsManager.calenderIcon),
                    Text(
                      StringsManager.mentioned,
                      style: AppStyles.b1MediumDMSans(),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    InviteButton()
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(AssetsManager.tagIcon),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      StringsManager.tags,
                      style: AppStyles.b1MediumDMSans(),
                    )
                  ],
                ),
                AddTaskTextField(hintText: "@tag", controller: tags),
                SizedBox(
                  height: 8.h,
                ),
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
