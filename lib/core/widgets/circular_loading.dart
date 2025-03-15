import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/colors_manager.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.black,
        color: ColorsManager.choosenColor,
      ),
    );
  }
}
