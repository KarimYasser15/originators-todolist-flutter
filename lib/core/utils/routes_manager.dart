import 'package:flutter/material.dart';
import 'package:todo_list/screens/auth/login/login.dart';
import 'package:todo_list/screens/auth/signup/signup.dart';
import 'package:todo_list/screens/home/home.dart';
import 'package:todo_list/screens/update_task/update_task.dart';

class RoutesManager {
  static const String login = "/login";
  static const String signUp = "/signup";
  static const String home = "/home";
  static const String updateTask = "/updateTask";

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case signUp:
        return MaterialPageRoute(builder: (context) => SignUpScreen());

      case home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case updateTask:
        return MaterialPageRoute(builder: (context) => UpdateTaskScreen());
    }
  }
}
