import 'dart:convert';
import 'package:http/http.dart';
import 'package:todo_list/core/api/api_manager.dart';
import 'package:http/http.dart' as http;
import 'package:todo_list/core/utils/handle_response.dart';
import 'package:todo_list/core/utils/local_storage.dart';
import 'package:todo_list/features/auth/data/models/login_response/login_response.dart';
import 'package:todo_list/features/tasks/data/models/delete_task_response.dart';
import 'package:todo_list/features/tasks/data/models/get_all_todos_response/create_get_todos_response.dart';
import 'package:todo_list/features/tasks/data/models/restore_todos_response.dart';

class TasksApiManager {
  // TODO: Change token to be dynamic and not static
  // TODO: Find a way to avoid duplicating the token code
  // TODO: Handle unauthorized response
  static String? token;
  static Future<CreateGetTodosResponse> createTodo(
      String title, String description,
      {String status = "todo"}) async {
    // token =
    // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZjNiZDZiMWJhZTdiODlkZTA1YmI5ZiIsInVzZXJuYW1lIjoia2FyaW0iLCJ2ZXJzaW9uIjowLCJpYXQiOjE3NDQ0OTg4MTcsImV4cCI6MTc0NDUwMjQxN30.kTr8S9vvO_UrLNEnNBuM0NTuKVvVTs0CxI4lsrgeiWs";
    LoginResponse userData = await LocalStorage.getUserData();
    token = userData.verificationToken.toString();
    HandleResponse().checkToken(token);
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
    HandleResponse().checkResponse(response);
    dynamic data = jsonDecode(response.body);
    CreateGetTodosResponse createTaskResponse =
        CreateGetTodosResponse.fromJson(data);
    if (createTaskResponse.statusCode == null) {
      return createTaskResponse;
    } else {
      throw Exception(createTaskResponse.message);
    }
  }

  static Future<List<CreateGetTodosResponse>> getAllTodos() async {
    print("TOKEN");
    LoginResponse userData = await LocalStorage.getUserData();
    token = userData.verificationToken.toString();
    HandleResponse().checkToken(token);
    final Response response = await http
        .get(Uri.parse(ApiManager.baseUrl + ApiManager.todoEndPoint), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    HandleResponse().checkResponse(response);
    var data = json.decode(response.body);
    List<CreateGetTodosResponse> x = data.map<CreateGetTodosResponse>((todos) {
      return CreateGetTodosResponse.fromJson(todos);
    }).toList();
    print("TOKEN21");

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
    HandleResponse().checkResponse(response);
    var data = json.decode(response.body);
    DeleteTaskResponse y = DeleteTaskResponse.fromJson(data);
    return y;
  }

  static Future<CreateGetTodosResponse> updateTodoStatus(
      int taskId, String status) async {
    final response = await http.put(
      Uri.parse(
          ApiManager.baseUrl + ApiManager.todoEndPoint + taskId.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{'status': status}),
    );
    HandleResponse().checkResponse(response);
    CreateGetTodosResponse updateTaskResponse =
        CreateGetTodosResponse.fromJson(jsonDecode(response.body));
    if (updateTaskResponse.statusCode == null) {
      return updateTaskResponse;
    } else {
      throw Exception(updateTaskResponse.message);
    }
  }

  static Future<DeleteTaskResponse> deleteAllTodos() async {
    final response = await http.delete(
      Uri.parse(ApiManager.baseUrl + ApiManager.deleteAllTodosEndPoint),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    HandleResponse().checkResponse(response);
    DeleteTaskResponse deleteAllTasksResponse =
        DeleteTaskResponse.fromJson(jsonDecode(response.body));
    if (deleteAllTasksResponse.statusCode == null) {
      return deleteAllTasksResponse;
    } else {
      throw Exception(deleteAllTasksResponse.message);
    }
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
    HandleResponse().checkResponse(response);
    DeleteTaskResponse deleteManyTodosResponse =
        DeleteTaskResponse.fromJson(jsonDecode(response.body));
    if (deleteManyTodosResponse.statusCode == null) {
      return deleteManyTodosResponse;
    } else {
      throw Exception(deleteManyTodosResponse.message);
    }
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
    HandleResponse().checkResponse(response);
    RestoreTodosResponse restoreTodosResponse =
        RestoreTodosResponse.fromJson(jsonDecode(response.body));
    if (restoreTodosResponse.statusCode == null) {
      return restoreTodosResponse;
    } else {
      throw Exception(restoreTodosResponse.message);
    }
  }

  static Future<RestoreTodosResponse> restoreAllTodos() async {
    final response = await http.patch(
      Uri.parse(ApiManager.baseUrl + ApiManager.restoreAllTodosEndPoint),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    HandleResponse().checkResponse(response);
    RestoreTodosResponse restoreTodosResponse =
        RestoreTodosResponse.fromJson(jsonDecode(response.body));
    if (restoreTodosResponse.statusCode == null) {
      return restoreTodosResponse;
    } else {
      throw Exception(restoreTodosResponse.message);
    }
  }
}
