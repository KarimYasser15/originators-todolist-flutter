import 'user.dart';

/// message : "Invalid username or password"
/// error : "Bad Request"
/// statusCode : 400
/// verificationToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YmYxYTExYzcyMWRhYzVmZmQyMGZjOSIsInVzZXJuYW1lIjoia2FyaW0iLCJpYXQiOjE3NDA1ODE1MjksImV4cCI6MTc0MDU4NTEyOX0.0_CDu_pm2Lpl80PyW9CDip4tIf3450klVrw9LOdLzI0"
/// user : {"id":"67bf1a11c721dac5ffd20fc9","name":"karim"}

class LoginResponse {
  LoginResponse({
    this.message,
    this.error,
    this.statusCode,
    this.verificationToken,
    this.user,
  });

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    error = json['error'];
    statusCode = json['statusCode'];
    verificationToken = json['verificationToken'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? message;
  String? error;
  num? statusCode;
  String? verificationToken;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['error'] = error;
    map['statusCode'] = statusCode;
    map['verificationToken'] = verificationToken;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}
