import 'dart:convert';

class GetAllTodosResponse {
  int? customId;
  String? title;
  String? status;
  String? description;
  List<dynamic>? tags;
  dynamic dueDate;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? message;
  String? error;
  int? statusCode;

  GetAllTodosResponse({
    this.customId,
    this.title,
    this.status,
    this.description,
    this.tags,
    this.dueDate,
    this.createdAt,
    this.updatedAt,
    this.message,
    this.error,
    this.statusCode,
  });

  factory GetAllTodosResponse.fromMap(Map<String, dynamic> data) {
    return GetAllTodosResponse(
      customId: data['customId'] as int?,
      title: data['title'] as String?,
      status: data['status'] as String?,
      description: data['description'] as String?,
      tags: data['tags'] as List<dynamic>?,
      dueDate: data['dueDate'] as dynamic,
      createdAt: data['createdAt'] == null
          ? null
          : DateTime.parse(data['createdAt'] as String),
      updatedAt: data['updatedAt'] == null
          ? null
          : DateTime.parse(data['updatedAt'] as String),
      message: data['message'] as String?,
      error: data['error'] as String?,
      statusCode: data['statusCode'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'customId': customId,
        'title': title,
        'status': status,
        'description': description,
        'tags': tags,
        'dueDate': dueDate,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'message': message,
        'error': error,
        'statusCode': statusCode,
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
