import 'package:http/http.dart' as http;
import 'package:todo_list/core/utils/messages.dart';

class HandleResponse {
  void checkResponse(http.Response response) {
    if (response.statusCode > 400 && response.statusCode < 500) {
      throw Exception(Messages.unAuthorizedUser);
    } else if (response.statusCode > 500) {
      throw Exception(Messages.noInternet);
    }
  }

  void checkToken(String? token) {
    if (token == null) {
      print("TESTT");
      throw Exception(Messages.unAuthorizedUser);
    }
  }
}
