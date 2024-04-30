import 'package:do_what_to_do/common/const/colors.dart';
import 'package:do_what_to_do/common/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TodoTitleTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final FocusNode focusNode;

  const TodoTitleTextField({
    required this.onChanged,
    required this.onEditingComplete,
    required this.focusNode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      onChanged: onChanged,
      style: AppTextTheme.displayXs.medium,
      decoration: InputDecoration.collapsed(
        hintText: 'Todo title',
        hintStyle: AppTextTheme.displayXs.medium.copyWith(color: AppColors.grey400),
      ),
      textInputAction: TextInputAction.next,
      onEditingComplete: onEditingComplete,
    );
  }
}
