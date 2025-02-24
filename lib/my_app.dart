import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesManager.signUp,
      onGenerateRoute: RoutesManager.router,
    );
  }
}
