import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_list/core/api/api_manager.dart';
import 'package:todo_list/core/utils/handle_response.dart';
import 'package:todo_list/core/utils/local_storage.dart';
import 'package:todo_list/features/auth/data/models/login_response/login_response.dart';
import 'package:todo_list/features/tasks/data/models/get_all_todos_response/create_get_todos_response.dart';

class UpdateApiManager {
  static String? token;

  static Future<CreateGetTodosResponse> updateTodo(
      int taskId, String title, String description,
      {String status = "todo"}) async {
    LoginResponse userData = await LocalStorage.getUserData();
    token = userData.verificationToken.toString();
    HandleResponse().checkToken(token);
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
    HandleResponse().checkResponse(response);
    CreateGetTodosResponse updateTaskResponse =
        CreateGetTodosResponse.fromJson(jsonDecode(response.body));
    if (updateTaskResponse.statusCode == null) {
      return updateTaskResponse;
    } else {
      throw Exception(updateTaskResponse.message);
    }
  }
}
