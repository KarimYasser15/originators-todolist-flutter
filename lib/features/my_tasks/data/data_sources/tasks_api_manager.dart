import 'dart:convert';

import 'package:todo_list/core/api/api_manager.dart';
import 'package:todo_list/features/my_tasks/data/models/CreateTaskResponse.dart';
import 'package:http/http.dart' as http;
import 'package:todo_list/features/my_tasks/data/models/DeleteTaskResponse.dart';
import 'package:todo_list/features/my_tasks/data/models/GetAllTodosResponse.dart';

class TasksApiManager {
  static String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YmYzNmQwNmRkMTY2MjkwMTRhMzgyMCIsInVzZXJuYW1lIjoibW9ydGFkYU1hbnNvciIsImlhdCI6MTc0MTAzNTA0NSwiZXhwIjoxNzQxMDM4NjQ1fQ.pRTQcfy-TMjobLuibFntL9qvGby7mV_aT3GvCV0-IX0";
  static Future<CreateTaskResponse> createTask(String title, String description,
      {String status = "todo"}) async {
    final response = await http.post(
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
