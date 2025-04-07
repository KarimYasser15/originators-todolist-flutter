import 'package:flutter/foundation.dart';
import 'package:todo_list/core/utils/messages.dart';
import 'package:todo_list/features/update_task/data/data_sources/update_api_manager.dart';

class UpdateViewModel extends ChangeNotifier {
  String? errorMessage;
  String? successMessage;
  bool isUpdated = false;
  bool isLoading = false;
  Future<void> updateTodo(int taskId, String title, String description) async {
    isLoading = true;
    notifyListeners();
    try {
      await UpdateApiManager.updateTodo(taskId, title, description);
      successMessage = Messages.taskUpdated;
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
