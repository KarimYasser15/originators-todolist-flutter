import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/config/app_theme.dart';
import 'package:todo_list/config/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(412, 870),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesManager.signUp,
        theme: AppTheme.lightTheme,
        onGenerateRoute: RoutesManager.router,
      ),
    );
  }
}
