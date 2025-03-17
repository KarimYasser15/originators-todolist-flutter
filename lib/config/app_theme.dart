import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/core/utils/colors_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: ColorsManager.choosenColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        shadowColor: ColorsManager.neutralGrey1,
        surfaceTintColor: Colors.white,
        elevation: 2,
      ),
      scaffoldBackgroundColor: Colors.white,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ColorsManager.choosenColor,
          splashColor: ColorsManager.choosenColor,
          foregroundColor: Colors.white,
          iconSize: 20,
          shape: CircleBorder(side: BorderSide.none)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 1,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: ColorsManager.choosenColor,
        // unselectedItemColor: Colors.grey
      ),
      // primaryColor: ColorsManager.choosenColor,
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: ColorsManager.black,
          selectionColor: ColorsManager.red,
          selectionHandleColor: ColorsManager.red));
}
