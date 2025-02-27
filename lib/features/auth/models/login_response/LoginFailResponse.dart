/// message : "Invalid username or password"
/// error : "Bad Request"
/// statusCode : 400

class LoginFailResponse {
  LoginFailResponse({
      this.message, 
      this.error, 
      this.statusCode,});

  LoginFailResponse.fromJson(dynamic json) {
    message = json['message'];
    error = json['error'];
    statusCode = json['statusCode'];
  }
  String? message;
  String? error;
  num? statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['error'] = error;
    map['statusCode'] = statusCode;
    return map;
  }

}