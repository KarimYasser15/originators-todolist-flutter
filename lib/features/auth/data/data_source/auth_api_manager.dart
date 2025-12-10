import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_list/core/api/api_manager.dart';
import 'package:todo_list/features/auth/data/models/login_response/login_response.dart';
import 'package:todo_list/features/auth/data/models/signup_response/sign_up_response.dart';

class AuthApiManager {
  static Future<SignUpResponse> userSignUp(
      String fullName, String userName, String email, String password) async {
    final response = await http.post(
      //TODO: send fullname and change name to username in signup
      //TODO: check all body in all apis
      // TODO: to use concatination with (+) too old code, I think there is a better way to do this
      Uri.parse(ApiManager.baseUrl + ApiManager.registerEndPoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'fullName': fullName,
        'username': userName,
        'password': password,
        'email': email
      }),
    );
    SignUpResponse signUpResponse =
        SignUpResponse.fromJson(jsonDecode(response.body));
    if (signUpResponse.statusCode == null) {
      return signUpResponse;
    } else {
      throw (signUpResponse.message.toString());
    }
  }

  static Future<LoginResponse> userLogin(
      String usernameOrEmail, String password, String type) async {
    final response = await http.post(
      Uri.parse(ApiManager.baseUrl + ApiManager.loginEndPoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'$type': usernameOrEmail, 'password': password}),
    );
    LoginResponse loginResponse =
        LoginResponse.fromJson(jsonDecode(response.body));
    print(loginResponse.toString());
    if (loginResponse.message == null) {
      return loginResponse;
    } else {
      throw (loginResponse.message.toString());
    }
  }
}
