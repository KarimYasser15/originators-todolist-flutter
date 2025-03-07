import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/messages.dart';
import 'package:todo_list/features/tasks/data/data_sources/tasks_api_manager.dart';
import 'package:todo_list/features/tasks/data/models/delete_task_response.dart';
import 'package:todo_list/features/tasks/data/models/get_all_todos_response/get_all_todos_response.dart';

class TasksViewModel extends ChangeNotifier {
  //TODO: Change tasks to be local instead of calling get all function every time
  List<GetAllTodosResponse> tasks = [];
  List<String> selectedTasksList = [];
  String? errorMessage;
  bool isUpdated = false;
  bool isDeleted = false;
  bool isLoading = false;
  bool isTasksSelected = false;
  int noOfTasksSelected = 0;

  Future<void> getAllTasks() async {
    isLoading = true;
    notifyListeners();
    try {
      tasks = await TasksApiManager.getAllTodos();
    } catch (e) {
      errorMessage = Messages.somethingWrong;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> addTask(String taskName, String taskDescription) async {
    try {
      var response =
          await TasksApiManager.createTodo(taskName, taskDescription);
      await getAllTasks();
      if (response.statusCode == 201) {
      } else {
        errorMessage = response.message;
        notifyListeners();
      }
    } catch (e) {
      errorMessage = Messages.somethingWrong;
    }
  }

  Future<void> deleteTask(String todoId) async {
    try {
      await TasksApiManager.deleteTodo(todoId);
      await getAllTasks();
    } catch (e) {
      errorMessage = Messages.somethingWrong;
    }
  }

  Future<void> updateTask(
      String taskId, String title, String description) async {
    isLoading = true;
    notifyListeners();
    try {
      await TasksApiManager.updateTodo(taskId, title, description);
      await getAllTasks();
    } catch (e) {
      errorMessage = Messages.somethingWrong;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> deleteAllTasks() async {
    try {
      DeleteTaskResponse response = await TasksApiManager.deleteAllTodos();
      if (response.statusCode == null) {
        getAllTasks();
      } else {
        errorMessage = response.message;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  Future<void> deleteManyTodos(List<String> todosIds) async {
    try {
      DeleteTaskResponse deleteManyTodosResponse =
          await TasksApiManager.deleteManyTodos(todosIds);
      if (deleteManyTodosResponse.statusCode == null) {
        getAllTasks();
      } else {
        errorMessage = deleteManyTodosResponse.message;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  void deleteAllOrMany() async {
    if (selectedTasksList.length == tasks.length) {
      await deleteAllTasks();
    } else {
      await deleteManyTodos(selectedTasksList);
    }
    resetDeleteAttributes();
    notifyListeners();
  }

  void selectTask(String taskId, bool deleteTask) {
    if (deleteTask) {
      noOfTasksSelected++;
      selectedTasksList.add(taskId);
    } else {
      noOfTasksSelected--;
      selectedTasksList.remove(taskId);
    }
    if (noOfTasksSelected == 0) {
      isTasksSelected = false;
    } else {
      isTasksSelected = true;
    }
    notifyListeners();
  }

  void resetDeleteAttributes() {
    isTasksSelected = false;
    selectedTasksList = [];
    noOfTasksSelected = 0;
  }
}
