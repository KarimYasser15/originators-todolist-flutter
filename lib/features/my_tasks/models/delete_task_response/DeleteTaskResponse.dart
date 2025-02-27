/// message : "Todo deleted successfully"

class DeleteTaskResponse {
  DeleteTaskResponse({
      this.message,});

  DeleteTaskResponse.fromJson(dynamic json) {
    message = json['message'];
  }
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }

}