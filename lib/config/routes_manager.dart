import 'package:flutter/material.dart';
import 'package:todo_list/features/auth/view/login/login.dart';
import 'package:todo_list/features/auth/view/signup/signup.dart';
import 'package:todo_list/features/home/screens/home.dart';
import 'package:todo_list/features/my_tasks/data/models/get_all_todos_response/get_all_todos_response.dart';
import 'package:todo_list/features/my_tasks/view/update_task_screen.dart';

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
        GetAllTodosResponse task = settings.arguments as GetAllTodosResponse;
        return MaterialPageRoute(
            builder: (context) => UpdateTaskScreen(
                  task: task,
                ));
    }
  }
}
