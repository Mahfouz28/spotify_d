import 'package:flutter/material.dart';

class BasicElevatedBotton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  final Color textColor;

  const BasicElevatedBotton({
    super.key,
    required this.text,
    required this.onPressed,

    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(foregroundColor: textColor),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
