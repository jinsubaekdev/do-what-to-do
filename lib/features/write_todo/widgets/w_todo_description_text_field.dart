import 'package:do_what_to_do/common/const/colors.dart';
import 'package:do_what_to_do/common/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TodoDescriptionTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final VoidCallback onActionPressed;
  final FocusNode focusNode;

  const TodoDescriptionTextField({
    required this.onChanged,
    required this.onActionPressed,
    required this.focusNode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      focusNode: focusNode,
      onChanged: onChanged,
      style: AppTextTheme.xl.regular,
      decoration: InputDecoration.collapsed(
        hintText: 'Add description',
        hintStyle: AppTextTheme.xl.regular.copyWith(color: AppColors.grey400),
      ),
      textInputAction: TextInputAction.newline,
      onEditingComplete: onActionPressed,
    );
  }
}
