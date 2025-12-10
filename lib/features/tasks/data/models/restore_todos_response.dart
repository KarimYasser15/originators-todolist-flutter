import 'dart:convert';

class RestoreTodosResponse {
  String? message;
  String? error;
  int? statusCode;

  RestoreTodosResponse({this.message, this.error, this.statusCode});

  factory RestoreTodosResponse.fromMap(Map<String, dynamic> data) {
    return RestoreTodosResponse(
      message: data['message'] as String?,
      error: data['error'] as String?,
      statusCode: data['statusCode'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'message': message,
        'error': error,
        'statusCode': statusCode,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RestoreTodosResponse].
  factory RestoreTodosResponse.fromJson(String data) {
    return RestoreTodosResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RestoreTodosResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
