import 'package:flutter/material.dart';
import 'package:todo_list/features/friends/data/friends_api_manager.dart';
import 'package:todo_list/features/friends/data/models/get_all_friends_response/get_all_friends_response.dart';

class FriendsViewModel extends ChangeNotifier {
  List<GetAllFriendsResponse> allFriends = [];
  bool isLoading = false;
  Future<void> addFriend(String username) async {
    try {
      await FriendsApiManager.addFriend(username);
      await getAllFriends();
    } catch (e) {}
    notifyListeners();
  }

  Future<void> getAllFriends() async {
    isLoading = true;
    try {
      allFriends = await FriendsApiManager.getAllFriends();
    } catch (e) {}
    isLoading = false;
    notifyListeners();
  }
}
