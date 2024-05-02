import 'package:flutter/material.dart';

class AddSubTodoButton extends StatelessWidget {
  static const iconSize = 32.0;
  final VoidCallback onPressed;

  const AddSubTodoButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Image.asset(
        'asset/images/add_sub_todo_icon.png',
        width: iconSize,
        height: iconSize,
      ),
    );
  }
}
