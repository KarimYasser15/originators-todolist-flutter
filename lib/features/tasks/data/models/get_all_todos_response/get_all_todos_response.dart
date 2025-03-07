import 'dart:convert';

class GetAllTodosResponse {
  String? status;
  String? description;
  List<dynamic>? tags;
  String? id;
  String? title;
  bool? completed;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  GetAllTodosResponse({
    this.status,
    this.description,
    this.tags,
    this.id,
    this.title,
    this.completed,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory GetAllTodosResponse.fromMap(dynamic data) {
    return GetAllTodosResponse(
      status: data['status'] as String?,
      description: data['description'] as String?,
      tags: data['tags'] as List<dynamic>?,
      id: data['_id'] as String?,
      title: data['title'] as String?,
      completed: data['completed'] as bool?,
      createdAt: data['createdAt'] == null
          ? null
          : DateTime.parse(data['createdAt'] as String),
      updatedAt: data['updatedAt'] == null
          ? null
          : DateTime.parse(data['updatedAt'] as String),
      v: data['__v'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'description': description,
        'tags': tags,
        '_id': id,
        'title': title,
        'completed': completed,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetAllTodosResponse].
  factory GetAllTodosResponse.fromJson(dynamic data) {
    return GetAllTodosResponse.fromMap(data);
  }

  /// `dart:convert`
  ///
  /// Converts [GetAllTodosResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
