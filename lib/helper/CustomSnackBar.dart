import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final Duration duration;
  final Animation<double> animation;

  const CustomSnackBar({
    required this.message,
    required this.backgroundColor,
    required this.duration,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      axisAlignment: 1.0,
      child: Container(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Icon(Icons.info_outline, color: Colors.black),
              const SizedBox(width: 8),
              Text(
                message,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
