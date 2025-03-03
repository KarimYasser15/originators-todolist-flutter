import 'package:flutter/foundation.dart';
import 'package:todo_list/core/utils/local_storage.dart';
import 'package:todo_list/features/auth/data/data_source/auth_api_manager.dart';
import 'package:todo_list/features/auth/data/models/login_response/LoginResponse.dart';
import 'package:todo_list/features/auth/data/models/signup_response/SignUpResponse.dart';

class AuthViewModel extends ChangeNotifier {
  String error = "";
  bool isLoading = false;
  bool isRightCredintials = false;
  Future<void> login(String userName, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      LoginResponse response =
          await AuthApiManager.userLogin(userName, password);
      if (response.statusCode == null) {
        LocalStorage.saveUserData(response);
        isRightCredintials = true;
      } else {
        isRightCredintials = false;
        error = response.message!;
      }
    } catch (e) {
      print("Login Error: " + e.toString());
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> signup(String userName, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      SignUpResponse response =
          await AuthApiManager.userSignUp(userName, password);
      if (response.statusCode == null) {
        // LocalStorage.saveUserData(response);
        isRightCredintials = true;
        print("Log in");
      } else {
        isRightCredintials = false;
        error = response.message!;
        print("Log out");
      }
    } catch (e) {
      print("Login Error: " + e.toString());
      // error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
