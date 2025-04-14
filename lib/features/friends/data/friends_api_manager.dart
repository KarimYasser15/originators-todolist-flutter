import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_list/core/api/api_manager.dart';
import 'package:todo_list/core/utils/handle_response.dart';
import 'package:todo_list/core/utils/local_storage.dart';
import 'package:todo_list/features/auth/data/models/login_response/login_response.dart';
import 'package:todo_list/features/friends/data/models/add_friend_response.dart';
import 'package:todo_list/features/friends/data/models/get_all_friends_response/get_all_friends_response.dart';

class FriendsApiManager {
  static String? token;
  static Future<AddFriendResponse> addFriend(String username) async {
    LoginResponse userData = await LocalStorage.getUserData();
    token = userData.verificationToken.toString();
    HandleResponse().checkToken(token);
    final http.Response response = await http.post(
      Uri.parse(ApiManager.baseUrl +
          ApiManager.friendsEndPoint(userData.user!.name!)),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'username': username,
      }),
    );
    HandleResponse().checkResponse(response);
    dynamic data = jsonDecode(response.body);
    AddFriendResponse addFriendResponse = AddFriendResponse.fromJson(data);
    print("TEST ${addFriendResponse.toString()}");
    if (addFriendResponse.statusCode == null) {
      return addFriendResponse;
    } else {
      throw Exception(addFriendResponse.message);
    }
  }

  static Future<List<GetAllFriendsResponse>> getAllFriends() async {
    LoginResponse userData = await LocalStorage.getUserData();
    token = userData.verificationToken.toString();
    HandleResponse().checkToken(token);
    final http.Response response = await http.get(
      Uri.parse(ApiManager.baseUrl +
          ApiManager.friendsEndPoint(userData.user!.name!)),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    HandleResponse().checkResponse(response);
    dynamic data = jsonDecode(response.body);
    List<GetAllFriendsResponse> x = data.map<GetAllFriendsResponse>((todos) {
      return GetAllFriendsResponse.fromJson(todos);
    }).toList();
    return x;
    // GetAllFriendsResponse getAllFriendsResponse =
    //     GetAllFriendsResponse.fromJson(data);
    // print("TEST ${getAllFriendsResponse.toString()}");
    // return getAllFriendsResponse;
  }
}
