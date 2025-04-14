class AddFriendResponse {
  String? message;
  String? error;
  int? statusCode;

  AddFriendResponse({this.message, this.error, this.statusCode});

  factory AddFriendResponse.fromJson(Map<String, dynamic> json) {
    return AddFriendResponse(
      message: json['message'] as String?,
      error: json['error'] as String?,
      statusCode: json['statusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'error': error,
        'statusCode': statusCode,
      };
}
