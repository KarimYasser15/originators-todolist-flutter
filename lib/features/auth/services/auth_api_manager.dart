import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_list/core/api/api_manager.dart';
import 'package:todo_list/core/utils/local_storage.dart';
import 'package:todo_list/features/auth/models/login_response/LoginResponse.dart';
import 'package:todo_list/features/auth/models/signup_response/SignUpResponse.dart';

class AuthApiManager {
  static Future<SignUpResponse> userSignUp(
      String userName, String password) async {
    print("User name: " + userName);
    print("Password: " + password);
    final response = await http.post(
      Uri.parse(ApiManager.baseUrl + ApiManager.registerEndPoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:
          jsonEncode(<String, String>{'name': userName, 'password': password}),
    );

    if (response.statusCode == 201) {
      SignUpResponse signUpResponse =
          SignUpResponse.fromJson(jsonDecode(response.body));
      return signUpResponse;
    } else {
      try {
        var jsonRespoonse = jsonDecode((response.body));
        SignUpResponse signUpResponse = SignUpResponse.fromJson(jsonRespoonse);
        throw Exception(signUpResponse.message);
      } catch (e) {
        throw Exception(e);
      }
    }
  }

  static Future<LoginResponse> userLogin(
      String userName, String password) async {
    final response = await http.post(
      Uri.parse(ApiManager.baseUrl + ApiManager.loginEndPoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:
          jsonEncode(<String, String>{'name': userName, 'password': password}),
    );
    if (response.statusCode == 200) {
      LoginResponse loginResponse =
          LoginResponse.fromJson(jsonDecode(response.body));
      LocalStorage.saveUserData(response);
      return loginResponse;
    } else {
      try {
        var jsonRespoonse = jsonDecode((response.body));
        LoginResponse loginResponse = LoginResponse.fromJson(jsonRespoonse);
        throw Exception(loginResponse.message);
      } catch (e) {
        throw Exception(e);
      }
    }
  }
}
