import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/my_app.dart';
import 'package:todo_list/features/my_tasks/providers/task_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => TaskProvider(), child: MyApp()));
}
