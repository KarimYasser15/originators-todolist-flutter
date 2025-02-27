import 'dart:convert';
import 'dart:io';

import 'package:todo_list/core/api/ErrorResponse.dart';
import 'package:todo_list/core/api/api_manager.dart';
import 'package:todo_list/features/my_tasks/models/create_task_response/CreateTaskResponse.dart';
import 'package:http/http.dart' as http;
import 'package:todo_list/features/my_tasks/models/get_all_todo_response/GetAllTodosResponse.dart';

class TasksApiManager {
  static String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YmYxYTExYzcyMWRhYzVmZmQyMGZjOSIsInVzZXJuYW1lIjoia2FyaW0iLCJpYXQiOjE3NDA2NzEwMzUsImV4cCI6MTc0MDY3NDYzNX0.N1Erb0JEJM8_OaZ48VtR2XYwbmcBFfHxDoamXe7J8K8";
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
    if (response.statusCode == 201) {
      CreateTaskResponse createTaskResponse =
          CreateTaskResponse.fromJson(jsonDecode(response.body));
      print("Task Created");
      return createTaskResponse;
    } else {
      try {
        var jsonRespoonse = jsonDecode((response.body));
        print("ERROR");
        print(jsonRespoonse.toString());
        CreateTaskResponse createTaskResponse =
            CreateTaskResponse.fromJson(jsonRespoonse);
        throw Exception(createTaskResponse.message);
      } catch (e) {
        throw Exception(e);
      }
    }
  }

  static Future<dynamic> getAllTodos() async {
    final response = await http
        .get(Uri.parse(ApiManager.baseUrl + ApiManager.todoEndPoint), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print("TESSSST");
    if (response.statusCode == 200) {
      print("TESSSST1");
      var data = json.decode(response.body);
      try {
        var x = data.map((eles) {
          return GetAllTodosResponse.fromJson(eles);
        }).toList();
        return x;
      } catch (e) {
        print("THROW ERROR " + e.toString());
      }
    } else {
      print("HELLO");
    }
  }

  static Future<dynamic> deleteTodo(String todoId) async {
    final response = await http.delete(
        Uri.parse(ApiManager.baseUrl + ApiManager.todoEndPoint + todoId),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });
    print("Deleted");
    if (response.statusCode == 200) {
      print("NOT ");
      var data = json.decode(response.body);
      try {
        var x = data.map((eles) {
          return GetAllTodosResponse.fromJson(eles);
        }).toList();
        return x;
      } catch (e) {
        print("THROW ERROR " + e.toString());
      }
    } else {
      print("HELLO");
    }
  }
}
