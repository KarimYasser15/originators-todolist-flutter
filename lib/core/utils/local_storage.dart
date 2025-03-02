import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/features/auth/models/login_response/LoginResponse.dart';
import 'package:todo_list/features/auth/models/login_response/User.dart';

class LocalStorage {
  late SharedPreferences preferences;
  static Future<void> saveUserData(Response userData) async {
    try {
      print(userData);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString("user", userData.body);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<User> getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userData = preferences.getString("user")!;
    LoginResponse userDataResponse =
        LoginResponse.fromJson(jsonDecode(userData));
    return userDataResponse.user!;
  }
}
