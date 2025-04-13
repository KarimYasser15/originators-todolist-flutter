import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/messages.dart';
import 'package:todo_list/features/tasks/data/data_sources/tasks_api_manager.dart';
import 'package:todo_list/features/tasks/data/models/get_all_todos_response/create_get_todos_response.dart';

class TasksViewModel extends ChangeNotifier {
  //TODO: Change tasks to be local instead of calling get all function every time
  //TODO: Display success message or error messages as Toast
  List<CreateGetTodosResponse> tasks = [];
  List<int> selectedTasksList = [];
  String? errorMessage;
  String? successMessage;
  bool isUpdated = false;
  bool isDeleted = false;
  bool isLoading = false;
  bool isTasksSelected = false;
  int noOfTasksSelected = 0;

  Future<void> getAllTodos() async {
    isLoading = true;
    // notifyListeners();
    try {
      tasks = await TasksApiManager.getAllTodos();
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> addTask(String taskName, String taskDescription) async {
    try {
      CreateGetTodosResponse response =
          await TasksApiManager.createTodo(taskName, taskDescription);
      tasks.add(response);
      successMessage = Messages.taskAdded;
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> deleteTask(int todoId) async {
    try {
      await TasksApiManager.deleteTodo(todoId);
      tasks.removeWhere((task) => task.customId == todoId);
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> updateTodoStatus(int taskId, String status) async {
    try {
      await TasksApiManager.updateTodoStatus(taskId, status);
      successMessage = Messages.taskUpdated;
      tasks
          .firstWhere(
            (task) => task.customId == taskId,
          )
          .status = status;
      // await getAllTodos();
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> deleteAllTasks() async {
    try {
      await TasksApiManager.deleteAllTodos();
      tasks = [];
    } catch (e) {
      errorMessage = e.toString();
    }
    resetDeleteAttributes();
    notifyListeners();
  }

  Future<void> deleteManyTodos(List<int> todosIds) async {
    try {
      await TasksApiManager.deleteManyTodos(todosIds);
      for (int i = 0; i < todosIds.length; i++) {
        tasks.removeWhere((task) => task.customId == todosIds[i]);
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    resetDeleteAttributes();
    notifyListeners();
  }

  Future<void> restoreManyTodos(List<String> todosIds) async {
    try {
      await TasksApiManager.restoreManyTodos(todosIds);
      await getAllTodos();
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  Future<void> restoreAllTodos() async {
    try {
      await TasksApiManager.restoreAllTodos();
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

  void selectTask(int taskId, bool deleteTask) {
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
