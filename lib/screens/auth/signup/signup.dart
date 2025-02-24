import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/routes_manager.dart';
import 'package:todo_list/widgets/default_submit_button.dart';
import 'package:todo_list/widgets/default_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DefaultTextFormField(
                hintText: "User Name",
                controller: userNameController,
              ),
              SizedBox(
                height: 10,
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
                height: 20,
              ),
              DefaultSubmitButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(
                          context, RoutesManager.login);
                    }
                  },
                  label: "Sign Up"),
            ],
          ),
        ),
      ),
    );
  }
}
