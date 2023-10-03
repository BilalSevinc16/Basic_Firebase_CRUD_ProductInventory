import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({
    Key? key,
    required this.text,
    required this.onCustomButtonPressed,
    required this.color,
  }) : super(key: key);
  String text;
  Color color;
  VoidCallback onCustomButtonPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: onCustomButtonPressed,
      child: Text(text),
    );
  }
}
