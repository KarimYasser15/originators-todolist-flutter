import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/my_app.dart';
import 'package:todo_list/presentation/screens/home/task_provider.dart';

void main() {
  runApp(Provider(create: (context) => TaskProvider(), child: MyApp()));
}
