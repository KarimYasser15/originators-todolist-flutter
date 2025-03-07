/// message : "Access denied, unauthorized"
/// error : "Unauthorized"
/// statusCode : 401
/// title : "don't use chat gpt"
/// completed : false
/// _id : "67c05c66fe047d6b246d6617"
/// createdAt : "2025-02-27T12:36:54.208Z"
/// updatedAt : "2025-02-27T12:36:54.208Z"
/// __v : 0

class CreateTaskResponse {
  CreateTaskResponse({
    this.message,
    this.error,
    this.statusCode,
    this.title,
    this.completed,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  CreateTaskResponse.fromJson(dynamic json) {
    message = json['message'];
    error = json['error'];
    statusCode = json['statusCode'];
    title = json['title'];
    completed = json['completed'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? message;
  String? error;
  num? statusCode;
  String? title;
  bool? completed;
  String? id;
  String? createdAt;
  String? updatedAt;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['error'] = error;
    map['statusCode'] = statusCode;
    map['title'] = title;
    map['completed'] = completed;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
