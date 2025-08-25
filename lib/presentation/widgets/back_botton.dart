import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final Color color;
  final double size;
  final VoidCallback? onPressed;

  const CustomBackButton({
    super.key,
    this.color = Colors.black,
    this.size = 16,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.arrow_back_ios_new,
        color:
            Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
        size: size,
      ),
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
    );
  }
}
