import 'dart:convert';

import 'package:http/http.dart';
import 'package:todo_list/core/api/api_manager.dart';
import 'package:todo_list/features/tasks/data/models/create_task_response.dart';
import 'package:http/http.dart' as http;
import 'package:todo_list/features/tasks/data/models/delete_task_response.dart';
import 'package:todo_list/features/tasks/data/models/get_all_todos_response/get_all_todos_response.dart';

class TasksApiManager {
  // TODO: Change token to be dynamic and not static
  static String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YzgzZmMwNTcyYzQ2ODZiMGIzYzUwNCIsInVzZXJuYW1lIjoia2FyaW0iLCJpYXQiOjE3NDEzODc0NDcsImV4cCI6MTc0MTM5MTA0N30.G__m_PiICJVp8-XwpqToguOxUD92l5MtfEeLenCB9_w";
  static Future<CreateTaskResponse> createTodo(String title, String description,
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
    CreateTaskResponse createTaskResponse =
        CreateTaskResponse.fromJson(jsonDecode(response.body));
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

  static Future<DeleteTaskResponse> deleteTodo(String todoId) async {
    final Response response = await http.delete(
        Uri.parse(ApiManager.baseUrl + ApiManager.todoEndPoint + todoId),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });
    var data = json.decode(response.body);
    DeleteTaskResponse y = DeleteTaskResponse.fromJson(data);
    return y;
  }

  static Future<GetAllTodosResponse> updateTodo(
      String taskId, String title, String description,
      {String status = "todo"}) async {
    final response = await http.put(
      Uri.parse(ApiManager.baseUrl + ApiManager.todoEndPoint + taskId),
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

  static Future<DeleteTaskResponse> deleteManyTodos(
      List<String> todosIds) async {
    final response = await http.delete(
      Uri.parse(ApiManager.baseUrl + ApiManager.deleteManyTodosEndPoint),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'ids': todosIds,
      }),
    );
    DeleteTaskResponse deleteManyTodosResponse =
        DeleteTaskResponse.fromJson(jsonDecode(response.body));
    return deleteManyTodosResponse;
  }
}
