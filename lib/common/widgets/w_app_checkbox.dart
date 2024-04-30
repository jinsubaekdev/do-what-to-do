import 'package:do_what_to_do/common/const/colors.dart';
import 'package:do_what_to_do/common/const/dimensions.dart';
import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget {
  static const checkboxSize = 32.0;
  static const checkIconSize = 24.0;
  static const checkboxWidth = 3.0;

  final bool value;
  final VoidCallback onPressed;

  const AppCheckbox(
    this.value, {
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: checkboxSize,
        height: checkboxSize,
        decoration: BoxDecoration(
          color: value ? AppColors.primary : null,
          borderRadius: borderRadius8,
          border: Border.all(
            color: value ? Colors.transparent : AppColors.gray200,
            width: checkboxWidth,
          ),
        ),
        child: Icon(
          Icons.check_rounded,
          size: checkIconSize,
          color: value ? Colors.white : Colors.transparent,
        ),
      ),
    );
  }
}
