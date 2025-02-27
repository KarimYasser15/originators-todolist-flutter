import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/config/routes_manager.dart';
import 'package:todo_list/core/utils/validators.dart';
import 'package:todo_list/features/auth/models/signup_response/SignUpResponse.dart';
import 'package:todo_list/features/auth/services/auth_api_manager.dart';
import 'package:todo_list/core/widgets/default_submit_button.dart';
import 'package:todo_list/core/widgets/default_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isRightCredentials = true;
  String? wrongCredentials;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
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
                    "Welcome To Todo App\nPlease Sign Up",
                    style: AppStyles.welcomeStyle,
                  ),
                ),
                DefaultTextFormField(
                  hintText: "User Name",
                  controller: userNameController,
                  validator: (username) {
                    return Validators.validateUsername(username);
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                DefaultTextFormField(
                  hintText: "Password",
                  controller: passwordController,
                  isPassword: true,
                  validator: (password) {
                    return Validators.validatePassword(password);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: DefaultSubmitButton(
                      onPressed: () async {
                        isRightCredentials = await signup();
                        setState(() {});
                      },
                      label: "Sign Up"),
                ),
                isRightCredentials
                    ? Container()
                    : Center(
                        child: Text(
                          wrongCredentials!,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                Center(
                  child: TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, RoutesManager.login),
                      child: Text(
                        "Already have an account?",
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

  Future<bool> signup() async {
    if (formKey.currentState!.validate()) {
      try {
        SignUpResponse signUpResponse = await AuthApiManager.userSignUp(
          userNameController.text,
          passwordController.text,
        );
        Navigator.pushNamed(context, RoutesManager.login);
        if (signUpResponse.name != null) {
          return true;
        } else {
          print("Sign Up failed: ${signUpResponse.message}");
          wrongCredentials = signUpResponse.message;
        }
        return false;
      } catch (e) {
        print("ERROR: $e");
      }
    }
    return true;
  }
}
