import 'package:flutter/material.dart';
import 'package:todo_list/features/my_tasks/data/data_sources/tasks_api_manager.dart';
// TODO: change parent folder name to be tasks/todos not my_tasks
class TasksViewModel extends ChangeNotifier {
  //TODO: change data type of tasks to List<GetAllTodosResponse> or GetAllTodosResponse
  //TODO: Change tasks to be local instead of calling get all function every time
  var tasks = [];
  bool isUpdated = false;
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
      print("Get Error :" + e.toString());
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> addTask(String taskName, String taskDescription) async {
    try {
      var response =
          await TasksApiManager.createTask(taskName, taskDescription);
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
    } catch (e) {
      print("Error deleting task: " + e.toString());
    }
  }

  Future<void> updateTask(
      String taskId, String title, String description) async {
    isLoading = true;
    notifyListeners();
    try {
      await TasksApiManager.updateTask(taskId, title, description);
      await getAllTasks();
    } catch (e) {
      print("Error Updating task: " + e.toString());
    }
    isLoading = false;
    notifyListeners();
  }
}
