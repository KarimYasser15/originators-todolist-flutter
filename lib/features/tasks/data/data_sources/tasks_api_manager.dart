import 'dart:convert';

import 'package:http/http.dart';
import 'package:todo_list/core/api/api_manager.dart';
import 'package:todo_list/features/tasks/data/models/create_task_response.dart';
import 'package:http/http.dart' as http;
import 'package:todo_list/features/tasks/data/models/delete_task_response.dart';
import 'package:todo_list/features/tasks/data/models/get_all_todos_response/create_get_todos_response.dart';
import 'package:todo_list/features/tasks/data/models/restore_todos_response.dart';

class TasksApiManager {
  // TODO: Change token to be dynamic and not static
  static String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3Y2I5NWM3Mjk4MmZjMDkzZDRlODBlYiIsInVzZXJuYW1lIjoia2FyaW0iLCJ2ZXJzaW9uIjowLCJpYXQiOjE3NDE3ODU2NDQsImV4cCI6MTc0MTc4OTI0NH0.M-OJLaAdz6f1rrr4rBC461lgONaaYxRTeIqbzmYkyMM";
  static Future<GetAllTodosResponse> createTodo(
      String title, String description,
      {String status = "todo"}) async {
    final Response response = await http.post(
      Uri.parse(ApiManager.baseUrl + ApiManager.todoEndPoint),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'title': title,
        'description': description,
        'status': status
      }),
    );
    dynamic data = jsonDecode(response.body);
    GetAllTodosResponse createTaskResponse = GetAllTodosResponse.fromJson(data);
    return createTaskResponse;
  }

  static Future<List<GetAllTodosResponse>> getAllTodos() async {
    final Response response = await http
        .get(Uri.parse(ApiManager.baseUrl + ApiManager.todoEndPoint), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = json.decode(response.body);
    List<GetAllTodosResponse> x = data.map<GetAllTodosResponse>((todos) {
      return GetAllTodosResponse.fromJson(todos);
    }).toList();
    return x;
  }

  static Future<DeleteTaskResponse> deleteTodo(int todoId) async {
    final Response response = await http.delete(
        Uri.parse(
            ApiManager.baseUrl + ApiManager.todoEndPoint + todoId.toString()),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });
    var data = json.decode(response.body);
    DeleteTaskResponse y = DeleteTaskResponse.fromJson(data);
    return y;
  }

  static Future<GetAllTodosResponse> updateTodo(
      int taskId, String title, String description,
      {String status = "todo"}) async {
    final response = await http.put(
      Uri.parse(
          ApiManager.baseUrl + ApiManager.todoEndPoint + taskId.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'title': title,
        'description': description,
        'status': status
      }),
    );
    GetAllTodosResponse updateTaskResponse =
        GetAllTodosResponse.fromJson(jsonDecode(response.body));
    return updateTaskResponse;
  }

  static Future<DeleteTaskResponse> deleteAllTodos() async {
    final response = await http.delete(
      Uri.parse(ApiManager.baseUrl + ApiManager.deleteAllTodosEndPoint),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    DeleteTaskResponse deleteAllTasksResponse =
        DeleteTaskResponse.fromJson(jsonDecode(response.body));
    return deleteAllTasksResponse;
  }

  static Future<DeleteTaskResponse> deleteManyTodos(List<int> todosIds) async {
    final response = await http.delete(
      Uri.parse(ApiManager.baseUrl + ApiManager.deleteManyTodosEndPoint),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, List<int>>{
        'ids': todosIds,
      }),
    );
    DeleteTaskResponse deleteManyTodosResponse =
        DeleteTaskResponse.fromJson(jsonDecode(response.body));
    return deleteManyTodosResponse;
  }

  static Future<RestoreTodosResponse> restoreManyTodos(
      List<String> todosIds) async {
    final response = await http.patch(
        Uri.parse(ApiManager.baseUrl + ApiManager.restoreManyTodosEndPoint),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, List<String>>{
          'ids': todosIds,
        }));
    RestoreTodosResponse restoreTodosResponse =
        RestoreTodosResponse.fromJson(jsonDecode(response.body));
    return restoreTodosResponse;
  }

  static Future<RestoreTodosResponse> restoreAllTodos() async {
    final response = await http.patch(
      Uri.parse(ApiManager.baseUrl + ApiManager.restoreAllTodosEndPoint),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    RestoreTodosResponse restoreTodosResponse =
        RestoreTodosResponse.fromJson(jsonDecode(response.body));
    return restoreTodosResponse;
  }
}
