/// message : "Access denied, unauthorized"
/// error : "Unauthorized"
/// statusCode : 401

class DeleteTaskResponse {
  DeleteTaskResponse({
    this.message,
    this.error,
    this.statusCode,
  });

  DeleteTaskResponse.fromJson(dynamic json) {
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
