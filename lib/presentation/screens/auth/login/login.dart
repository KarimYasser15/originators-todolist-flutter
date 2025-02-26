import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/config/theme/app_styles.dart';
import 'package:todo_list/core/utils/routes_manager.dart';
import 'package:todo_list/widgets/default_submit_button.dart';
import 'package:todo_list/widgets/default_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Log In",
          style: AppStyles.appBarStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 150.h, bottom: 70.h),
                  child: Text(
                    "Welcome To Todo App\nPlease Log In",
                    style: AppStyles.welcomeStyle,
                  ),
                ),
                DefaultTextFormField(
                  hintText: "User Name",
                  controller: userNameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter a user name";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                DefaultTextFormField(
                  hintText: "Password",
                  controller: passwordController,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter a password";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: DefaultSubmitButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushReplacementNamed(
                              context, RoutesManager.home);
                        }
                      },
                      label: "Log In"),
                ),
                Center(
                  child: TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, RoutesManager.signUp),
                      child: Text(
                        "Don't have an account?",
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.underline),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
