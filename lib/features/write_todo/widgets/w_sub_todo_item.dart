import 'package:do_what_to_do/common/const/colors.dart';
import 'package:do_what_to_do/common/theme/app_theme.dart';
import 'package:do_what_to_do/common/widgets/w_app_checkbox.dart';
import 'package:do_what_to_do/common/widgets/w_width_and_height.dart';
import 'package:do_what_to_do/features/write_todo/models/controllable_sub_todo.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SubTodoItem extends StatelessWidget {
  final ControllableSubTodo controllableSubTodo;
  final VoidCallback onCheckPressed;
  final VoidCallback onActionPressed;
  static const verticalPadding = 8.0;

  const SubTodoItem({
    required this.controllableSubTodo,
    required this.onCheckPressed,
    required this.onActionPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SmallCheckbox(
          controllableSubTodo.subTodo.isComplete,
          onPressed: onCheckPressed,
        ),
        width12,
        Expanded(
          child: TextField(
            maxLines: 1,
            controller: controllableSubTodo.controller,
            focusNode: controllableSubTodo.focusNode,
            style: AppTextTheme.xl.regular.copyWith(color: AppColors.grey800),
            decoration: InputDecoration.collapsed(
              hintText: '하위 할 일',
              hintStyle: AppTextTheme.xl.regular.copyWith(color: AppColors.grey400),
            ),
            textInputAction: TextInputAction.next,
            onEditingComplete: onActionPressed,
          ),
        ),
      ],
    ).pSymmetric(v: verticalPadding);
  }
}
