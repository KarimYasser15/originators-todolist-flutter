import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/core/utils/assets_manager.dart';
import 'package:todo_list/core/utils/colors_manager.dart';
import 'package:todo_list/core/utils/strings_manager.dart';
import 'package:todo_list/core/utils/validators.dart';
import 'package:todo_list/features/friends/view_model/friends_view_model.dart';
import 'package:todo_list/features/tasks/view/widget/task_item_widget.dart';

class AddFriendBottomSheet extends StatefulWidget {
  AddFriendBottomSheet({super.key, required this.viewModel});
  FriendsViewModel viewModel;

  @override
  State<AddFriendBottomSheet> createState() => _AddFriendBottomSheetState();
}

class _AddFriendBottomSheetState extends State<AddFriendBottomSheet> {
  var formKey = GlobalKey<FormState>();
  TextEditingController addFriendController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
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
                  Container(
                    height: 3.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                        color: ColorsManager.neutralGrey8,
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        StringsManager.addFriend,
                        style: AppStyles.h4MediumDMSans(
                            color: ColorsManager.black),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(AssetsManager.closeIcon)),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AssetsManager.addTitleIcon),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        StringsManager.userName,
                        style: AppStyles.b1MediumDMSans(),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  TextFormField(
                    style: AppStyles.h5RegularDMSans(),
                    decoration: InputDecoration(
                      hintText: StringsManager.userName,
                      hintStyle: AppStyles.h5RegularRoboto,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.w, horizontal: 10.h),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          borderSide:
                              BorderSide(color: ColorsManager.neutralGrey6)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          borderSide:
                              BorderSide(color: ColorsManager.neutralGrey6)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          borderSide:
                              BorderSide(color: ColorsManager.neutralGrey6)),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorsManager.neutralGrey6),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                    ),
                    maxLines: null,
                    controller: addFriendController,
                    validator: (value) => Validators.validateUsername(value),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    height: 55.h,
                    child: ElevatedButton.icon(
                      icon: SvgPicture.asset(AssetsManager.plusCircleIcon),
                      label: Text(
                        StringsManager.addFriend,
                        style: AppStyles.b1MediumDMSans(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.choosenColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r)),
                          alignment: Alignment.center),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            await widget.viewModel
                                .addFriend(addFriendController.text);
                          } catch (e) {
                            print("HELLO ${e.toString()}");
                          }
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
