import 'package:flutter/foundation.dart';
import 'package:todo_list/core/utils/local_storage.dart';
import 'package:todo_list/core/utils/validators.dart';
import 'package:todo_list/features/auth/data/data_source/auth_api_manager.dart';
import 'package:todo_list/features/auth/data/models/login_response/login_response.dart';

class AuthViewModel extends ChangeNotifier {
  String error = "";
  bool isLoading = false;
  bool isRightCredintials = false;
  Future<void> login(String username, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      String type = "username";
      if (Validators.validateEmail(username)) {
        type = "email";
      }
      LoginResponse response =
          await AuthApiManager.userLogin(username, password, type);
      LocalStorage.saveUserData(response);
      isRightCredintials = true;
    } catch (e) {
      error = e.toString();
      // print(error);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> signup(
      String fullName, String userName, String email, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      await AuthApiManager.userSignUp(fullName, userName, email, password);
      // LocalStorage.saveUserData(response);
      isRightCredintials = true;
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
