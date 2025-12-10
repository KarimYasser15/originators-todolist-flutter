import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/core/utils/colors_manager.dart';

class AppStyles {
  static const TextStyle appBarStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);
  static const TextStyle buttonTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16);
  static const TextStyle welcomeStyle =
      TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle h5RegularRoboto = GoogleFonts.roboto(
    color: ColorsManager.neutralGrey6,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle b1MediumDMSans({Color color = Colors.black}) =>
      GoogleFonts.dmSans(
        color: color,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      );
  static TextStyle b2RegularDMSans({Color color = Colors.black}) =>
      GoogleFonts.dmSans(
        color: color,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      );
  static TextStyle b1RegularDMSans(
          {Color color = ColorsManager.neutralGrey8}) =>
      GoogleFonts.dmSans(
        color: color,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      );
  static TextStyle bodyRegular({Color color = Colors.white}) =>
      GoogleFonts.roboto(
        color: color,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      );
  static TextStyle h5RegularDMSans({Color color = Colors.black}) =>
      GoogleFonts.dmSans(
        color: color,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      );
  static TextStyle h5MediumDMSans({Color color = Colors.black}) =>
      GoogleFonts.dmSans(
        color: color,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      );
  static TextStyle h2MediumDMSans = GoogleFonts.dmSans(
    color: ColorsManager.red,
    fontSize: 30.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle h4MediumDMSans({Color color = ColorsManager.neutralGrey9}) =>
      GoogleFonts.dmSans(
        color: color,
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      );
  static TextStyle h3MediumDMSans({Color color = ColorsManager.neutralGrey9}) =>
      GoogleFonts.dmSans(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
      );
}
