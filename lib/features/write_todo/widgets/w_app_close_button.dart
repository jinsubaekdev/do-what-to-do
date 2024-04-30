import 'package:flutter/material.dart';

class AppCloseButton extends StatelessWidget {
  static const iconSize = 32.0;

  final VoidCallback onPressed;
  const AppCloseButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.close_rounded, size: iconSize),
    );
  }
}
