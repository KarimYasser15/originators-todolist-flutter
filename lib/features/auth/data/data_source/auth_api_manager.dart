import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_list/core/api/api_manager.dart';
import 'package:todo_list/features/auth/data/models/login_response/login_response.dart';
import 'package:todo_list/features/auth/data/models/signup_response/sign_up_response.dart';

class AuthApiManager {
  static Future<SignUpResponse> userSignUp(
      String userName, String password) async {
    final response = await http.post(
      // TODO: to use concatination with (+) too old code, I think there is a better way to do this
      Uri.parse(ApiManager.baseUrl + ApiManager.registerEndPoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:
          jsonEncode(<String, String>{'name': userName, 'password': password}),
    );

    SignUpResponse signUpResponse =
        SignUpResponse.fromJson(jsonDecode(response.body));
    return signUpResponse;
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
    LoginResponse loginResponse =
        LoginResponse.fromJson(jsonDecode(response.body));
    return loginResponse;
  }
}
