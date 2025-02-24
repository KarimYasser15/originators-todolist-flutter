import 'package:flutter/material.dart';

class DefaultSubmitButton extends StatelessWidget {
  DefaultSubmitButton({required this.onPressed, required this.label});

  String label;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, fixedSize: Size(255, 52)),
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
