import 'package:flutter/material.dart';
import 'package:todo_list/features/my_tasks/models/get_all_todo_response/GetAllTodosResponse.dart';
import 'package:todo_list/features/my_tasks/services/tasks_api_manager.dart';

class TaskProvider extends ChangeNotifier {
  List<dynamic> tasks = [];
  Future<void> getAllTasks() async {
    try {
      var x = await TasksApiManager.getAllTodos();
      // tasks = x.map((eles) {
      //   return GetAllTodosResponse.fromJson(eles);
      // }).toList();
      tasks = x;
      print("SADFSD");
      print("ETSGDS" + tasks[0].id.toString());
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}
