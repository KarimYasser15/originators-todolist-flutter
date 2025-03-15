import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/core/utils/colors_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r)))),
      scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey),
      // primaryColor: ColorsManager.choosenColor,
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: ColorsManager.black,
          selectionColor: ColorsManager.red,
          selectionHandleColor: ColorsManager.red));
}
