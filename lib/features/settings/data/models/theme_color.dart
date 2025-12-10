import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/colors_manager.dart';

class ThemeColor {
  Color color;
  ThemeColor({required this.color});

  static List<ThemeColor> colors = [
    ThemeColor(color: ColorsManager.red),
    ThemeColor(color: ColorsManager.green),
    ThemeColor(color: ColorsManager.cyan),
    ThemeColor(color: ColorsManager.purple),
    ThemeColor(color: ColorsManager.pink),
    ThemeColor(color: ColorsManager.lightBlue),
  ];
}
