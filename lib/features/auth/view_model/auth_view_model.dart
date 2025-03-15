import 'package:flutter/foundation.dart';
import 'package:todo_list/core/utils/local_storage.dart';
import 'package:todo_list/features/auth/data/data_source/auth_api_manager.dart';
import 'package:todo_list/features/auth/data/models/login_response/login_response.dart';

class AuthViewModel extends ChangeNotifier {
  String error = "";
  bool isLoading = false;
  bool isRightCredintials = false;
  Future<void> login(String email, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      LoginResponse response = await AuthApiManager.userLogin(email, password);
      LocalStorage.saveUserData(response);
      isRightCredintials = true;
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> signup(String userName, String email, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      await AuthApiManager.userSignUp(userName, email, password);
      // LocalStorage.saveUserData(response);
      isRightCredintials = true;
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
