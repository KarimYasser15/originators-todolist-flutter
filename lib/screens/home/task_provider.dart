import 'package:flutter/material.dart';
import 'package:todo_list/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> tasks = [];
  Future<void> getAllTasks() async {
    notifyListeners();
  }
}
