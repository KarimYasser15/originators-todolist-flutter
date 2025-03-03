import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/config/routes_manager.dart';
import 'package:todo_list/core/utils/validators.dart';
import 'package:todo_list/core/widgets/default_submit_button.dart';
import 'package:todo_list/core/widgets/default_text_form_field.dart';
import 'package:todo_list/features/auth/view_model/auth_view_model.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthViewModel(),
      child: Consumer<AuthViewModel>(
        builder: (context, viewModel, child) => Scaffold(
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
                            if (formKey.currentState!.validate()) {
                              await viewModel.signup(userNameController.text,
                                  passwordController.text);
                              if (viewModel.isRightCredintials) {
                                Navigator.pushReplacementNamed(
                                    context, RoutesManager.login);
                              }
                            }
                          },
                          label: "Sign Up"),
                    ),
                    viewModel.isRightCredintials
                        ? Container()
                        : Center(
                            child: Text(
                              viewModel.error,
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
        ),
      ),
    );
  }
}
