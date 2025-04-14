class GetAllFriendsResponse {
  String? username;

  GetAllFriendsResponse({this.username});

  factory GetAllFriendsResponse.fromJson(Map<String, dynamic> json) {
    return GetAllFriendsResponse(
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
      };
}
