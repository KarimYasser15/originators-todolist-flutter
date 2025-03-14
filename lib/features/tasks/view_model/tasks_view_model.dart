import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/messages.dart';
import 'package:todo_list/features/tasks/data/data_sources/tasks_api_manager.dart';
import 'package:todo_list/features/tasks/data/models/delete_task_response.dart';
import 'package:todo_list/features/tasks/data/models/get_all_todos_response/create_get_todos_response.dart';
import 'package:todo_list/features/tasks/data/models/restore_todos_response.dart';

class TasksViewModel extends ChangeNotifier {
  //TODO: Change tasks to be local instead of calling get all function every time
  //TODO: Display success message or error messages as Toast
  List<GetAllTodosResponse> tasks = [];
  List<int> selectedTasksList = [];
  String? errorMessage;
  String? successMessage;
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
      print(e.toString());
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> addTask(String taskName, String taskDescription) async {
    try {
      GetAllTodosResponse response =
          await TasksApiManager.createTodo(taskName, taskDescription);
      if (response.statusCode == null) {
        tasks.add(response);
        successMessage = Messages.taskAdded;
      } else {
        errorMessage = response.message;
      }
    } catch (e) {
      errorMessage = Messages.somethingWrong;
      print(e);
    }
    notifyListeners();
  }

  Future<void> deleteTask(int todoId) async {
    try {
      await TasksApiManager.deleteTodo(todoId);
      tasks.removeWhere((task) => task.customId == todoId);
    } catch (e) {
      errorMessage = Messages.somethingWrong;
    }
    notifyListeners();
  }

  Future<void> updateTask(int taskId, String title, String description) async {
    isLoading = true;
    notifyListeners();
    try {
      await TasksApiManager.updateTodo(taskId, title, description);
      successMessage = Messages.taskUpdated;
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
        tasks = [];
      } else {
        errorMessage = response.message;
      }
    } catch (e) {
      errorMessage = Messages.somethingWrong;
    }
    resetDeleteAttributes();
    notifyListeners();
  }

  Future<void> deleteManyTodos(List<int> todosIds) async {
    try {
      DeleteTaskResponse deleteManyTodosResponse =
          await TasksApiManager.deleteManyTodos(todosIds);
      if (deleteManyTodosResponse.statusCode == null) {
        // getAllTasks();
        for (int i = 0; i < todosIds.length; i++) {
          tasks.removeWhere((task) => task.customId == todosIds[i]);
        }
      } else {
        errorMessage = deleteManyTodosResponse.message;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    resetDeleteAttributes();
    notifyListeners();
  }

  Future<void> restoreManyTodos(List<String> todosIds) async {
    try {
      RestoreTodosResponse restoreTodosResponse =
          await TasksApiManager.restoreManyTodos(todosIds);
      if (restoreTodosResponse.statusCode == null) {
        await getAllTasks();
      } else {
        errorMessage = restoreTodosResponse.message;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  Future<void> restoreAllTodos() async {
    try {
      RestoreTodosResponse restoreTodosResponse =
          await TasksApiManager.restoreAllTodos();
      if (restoreTodosResponse.statusCode == null) {
      } else {
        errorMessage = restoreTodosResponse.message;
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
