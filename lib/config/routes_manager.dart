import 'package:flutter/material.dart';
import 'package:todo_list/features/auth/view/screens/login.dart';
import 'package:todo_list/features/auth/view/screens/signup.dart';
import 'package:todo_list/features/friends/view/friends_screen.dart';
import 'package:todo_list/features/home/screens/home.dart';
import 'package:todo_list/features/settings/view/screens/settings_screen.dart';
import 'package:todo_list/features/tasks/data/models/get_all_todos_response/create_get_todos_response.dart';
import 'package:todo_list/features/trash/view/screens/trash_screen.dart';
import 'package:todo_list/features/update_task/view/update_task_screen.dart';

class RoutesManager {
  static const String login = "/login";
  static const String signUp = "/signup";
  static const String home = "/home";
  static const String updateTask = "/updateTask";
  static const String settingsScreen = "/settings";
  static const String trash = "/trash";
  static const String friends = "/friends";

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case signUp:
        return MaterialPageRoute(builder: (context) => SignUpScreen());

      case settingsScreen:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      case trash:
        return MaterialPageRoute(builder: (_) => TrashScreen());
      case friends:
        return MaterialPageRoute(builder: (_) => FriendsScreen());

      case home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case updateTask:
        var arguments = settings.arguments as Map;
        CreateGetTodosResponse task = arguments["task"];
        return MaterialPageRoute(
            builder: (context) => UpdateTaskScreen(
                  task: task,
                ));
    }
    return null;
  }
}
