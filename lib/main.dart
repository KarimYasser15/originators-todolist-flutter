import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/features/tasks/view_model/tasks_view_model.dart';
import 'package:todo_list/my_app.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => TasksViewModel(), child: MyApp()));
}
