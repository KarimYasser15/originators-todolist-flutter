import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/features/auth/data/models/login_response/LoginResponse.dart';
import 'package:todo_list/features/auth/data/models/login_response/User.dart';

class LocalStorage {
  late SharedPreferences preferences;
  static Future<void> saveUserData(LoginResponse userData) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String response = jsonEncode(userData);
      await preferences.setString("user", response);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<LoginResponse> getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userData = preferences.getString("user")!;
    LoginResponse userDataResponse =
        LoginResponse.fromJson(jsonDecode(userData));
    return userDataResponse;
  }
}
