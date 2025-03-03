/// id : "67bf1a11c721dac5ffd20fc9"
/// name : "karim"
/// message : "User already exists"
/// error : "Bad Request"
/// statusCode : 400

class SignUpResponse {
  SignUpResponse({
      this.id, 
      this.name, 
      this.message, 
      this.error, 
      this.statusCode,});

  SignUpResponse.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    message = json['message'];
    error = json['error'];
    statusCode = json['statusCode'];
  }
  String? id;
  String? name;
  String? message;
  String? error;
  num? statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['message'] = message;
    map['error'] = error;
    map['statusCode'] = statusCode;
    return map;
  }

}