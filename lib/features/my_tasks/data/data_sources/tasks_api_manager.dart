import 'dart:convert';

import 'package:todo_list/core/api/api_manager.dart';
import 'package:todo_list/features/my_tasks/data/models/CreateTaskResponse.dart';
import 'package:http/http.dart' as http;
import 'package:todo_list/features/my_tasks/data/models/DeleteTaskResponse.dart';
import 'package:todo_list/features/my_tasks/data/models/GetAllTodosResponse.dart';

class TasksApiManager {
  static String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YmYxYTExYzcyMWRhYzVmZmQyMGZjOSIsInVzZXJuYW1lIjoia2FyaW0iLCJpYXQiOjE3NDA5MjU2MzYsImV4cCI6MTc0MDkyOTIzNn0.56YiperEqFDn9uhUG8XNKMMquNiPpD50tjPrsLH7aDA";
  static Future<CreateTaskResponse> createTask(String title,
      {int completed = 0}) async {
    final response = await http.post(
      Uri.parse(ApiManager.baseUrl + ApiManager.todoEndPoint),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body:
          jsonEncode(<String, dynamic>{'title': title, 'completed': completed}),
    );
    CreateTaskResponse createTaskResponse =
        CreateTaskResponse.fromJson(jsonDecode(response.body));
    return createTaskResponse;
  }

  static Future<dynamic> getAllTodos() async {
    final response = await http
        .get(Uri.parse(ApiManager.baseUrl + ApiManager.todoEndPoint), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = json.decode(response.body);
    dynamic x = data.map((eles) {
      return GetAllTodosResponse.fromJson(eles);
    }).toList();
    return x;
  }

  static Future<DeleteTaskResponse> deleteTodo(String todoId) async {
    final response = await http.delete(
        Uri.parse(ApiManager.baseUrl + ApiManager.todoEndPoint + todoId),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });
    var data = json.decode(response.body);
    var y = DeleteTaskResponse.fromJson(data);
    return y;
  }
}
