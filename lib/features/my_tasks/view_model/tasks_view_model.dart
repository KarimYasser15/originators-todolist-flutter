import 'package:flutter/material.dart';
import 'package:todo_list/features/my_tasks/data/data_sources/tasks_api_manager.dart';

class TasksViewModel extends ChangeNotifier {
  //TODO: change data type of tasks to List<GetAllTodosResponse> or GetAllTodosResponse
  var tasks = [];
  bool isDeleted = false;
  String? errorMessage;
  bool isLoading = false;
  Future<void> getAllTasks() async {
    isLoading = true;
    notifyListeners();
    try {
      var x = await TasksApiManager.getAllTodos();
      tasks = x;
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> addTask(String taskName) async {
    try {
      var response = await TasksApiManager.createTask(taskName);
      await getAllTasks();
      if (response.statusCode == 201) {
      } else {
        errorMessage = response.message;
        notifyListeners();
      }
    } catch (e) {
      print("Error creating task: " + e.toString());
    }
  }

  Future<void> deleteTask(String todoId) async {
    try {
      await TasksApiManager.deleteTodo(todoId);
      await getAllTasks();
      print("Entered function");
    } catch (e) {
      print("Error deleting task: " + e.toString());
    }
  }
}
