import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/config/routes_manager.dart';
import 'package:todo_list/core/utils/validators.dart';
import 'package:todo_list/features/auth/services/auth_api_manager.dart';
import 'package:todo_list/features/auth/models/login_response/LoginResponse.dart';
import 'package:todo_list/core/widgets/default_submit_button.dart';
import 'package:todo_list/core/widgets/default_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isRightCredentials = true;

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
                        isRightCredentials = await login();
                        setState(() {});
                      },
                      label: "Log In"),
                ),
                isRightCredentials
                    ? Container()
                    : Center(
                        child: Text(
                          "Incorrect Username or Password!",
                          style: TextStyle(color: Colors.red),
                        ),
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

  Future<bool> login() async {
    if (formKey.currentState!.validate()) {
      try {
        LoginResponse loginResponse = await AuthApiManager.userLogin(
          userNameController.text,
          passwordController.text,
        );
        Navigator.pushNamed(context, RoutesManager.home);
        return true;
      } catch (e) {
        print("Login failed: $e");
        return false;
      }
    }
    return true;
  }
}
