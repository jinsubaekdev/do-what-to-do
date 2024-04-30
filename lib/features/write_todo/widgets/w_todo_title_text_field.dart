import 'package:do_what_to_do/common/const/colors.dart';
import 'package:do_what_to_do/common/theme/app_theme.dart';
import 'package:do_what_to_do/features/write_todo/widgets/w_app_close_button.dart';
import 'package:flutter/material.dart';

class TodoTitleTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final VoidCallback onEditingComplete;
  final FocusNode focusNode;
  final VoidCallback onClosePressed;

  const TodoTitleTextField({
    required this.onChanged,
    required this.controller,
    required this.onEditingComplete,
    required this.focusNode,
    required this.onClosePressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            focusNode: focusNode,
            controller: controller,
            onChanged: onChanged,
            style: AppTextTheme.displayXs.medium,
            decoration: InputDecoration.collapsed(
              hintText: 'Todo title',
              hintStyle: AppTextTheme.displayXs.medium.copyWith(color: AppColors.grey400),
            ),
            textInputAction: TextInputAction.next,
            onEditingComplete: onEditingComplete,
          ),
        ),
        AppCloseButton(onPressed: onClosePressed),
      ],
    );
  }
}
