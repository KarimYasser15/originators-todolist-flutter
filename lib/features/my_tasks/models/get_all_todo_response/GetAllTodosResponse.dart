import 'dart:convert'; // For JSON decoding

class GetAllTodosResponse {
  GetAllTodosResponse({
    this.id,
    this.title,
    this.completed,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  GetAllTodosResponse.fromJson(Map<String, dynamic> json) {
    //Map<String, dynamic> jsonMap = jsonDecode(json);
    //print(jsonMap);
    id = json['_id'];
    title = json['title'];
    completed = json['completed'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
  String? title;
  bool? completed;
  String? createdAt;
  String? updatedAt;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['completed'] = completed;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
