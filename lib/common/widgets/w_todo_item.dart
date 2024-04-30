import 'package:do_what_to_do/common/theme/app_theme.dart';
import 'package:do_what_to_do/common/widgets/w_app_checkbox.dart';
import 'package:do_what_to_do/common/widgets/w_width_and_height.dart';
import 'package:do_what_to_do/features/todos/models/vo_todo.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onCheckPressed;
  static const verticalPadding = 8.0;

  const TodoItem({
    required this.todo,
    required this.onCheckPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppCheckbox(todo.isComplete, onPressed: onCheckPressed),
        width8,
        todo.title.text.textStyle(AppTextTheme.lg.semiBold).make(),
      ],
    ).pSymmetric(v: verticalPadding);
  }
}
