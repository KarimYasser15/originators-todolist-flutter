import 'dart:convert';

class GetAllTodosResponse {
  dynamic dueDate;
  int? customId;
  String? title;
  String? status;
  String? description;
  List<dynamic>? tags;
  DateTime? createdAt;
  DateTime? updatedAt;

  GetAllTodosResponse({
    this.dueDate,
    this.customId,
    this.title,
    this.status,
    this.description,
    this.tags,
    this.createdAt,
    this.updatedAt,
  });

  factory GetAllTodosResponse.fromMap(Map<String, dynamic> data) {
    return GetAllTodosResponse(
      dueDate: data['dueDate'] as dynamic,
      customId: data['customId'] as int?,
      title: data['title'] as String?,
      status: data['status'] as String?,
      description: data['description'] as String?,
      tags: data['tags'] as List<dynamic>?,
      createdAt: data['createdAt'] == null
          ? null
          : DateTime.parse(data['createdAt'] as String),
      updatedAt: data['updatedAt'] == null
          ? null
          : DateTime.parse(data['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toMap() => {
        'dueDate': dueDate,
        'customId': customId,
        'title': title,
        'status': status,
        'description': description,
        'tags': tags,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
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
