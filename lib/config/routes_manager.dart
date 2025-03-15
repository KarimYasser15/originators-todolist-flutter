import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/features/auth/view/screens/login.dart';
import 'package:todo_list/features/auth/view/screens/signup.dart';
import 'package:todo_list/features/home/screens/home.dart';
import 'package:todo_list/features/tasks/data/models/get_all_todos_response/create_get_todos_response.dart';
import 'package:todo_list/features/tasks/view/update_task_screen.dart';
import 'package:todo_list/features/tasks/view_model/tasks_view_model.dart';

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
        var arguments = settings.arguments as Map;
        TasksViewModel viewModel = arguments["viewModel"];
        GetAllTodosResponse task = arguments["task"];
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider.value(
                  value: viewModel,
                  child: UpdateTaskScreen(
                    task: task,
                  ),
                ));
    }
  }
}
