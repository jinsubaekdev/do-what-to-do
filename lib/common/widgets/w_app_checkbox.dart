import 'package:do_what_to_do/common/const/colors.dart';
import 'package:do_what_to_do/common/const/dimensions.dart';
import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget {
  static const checkIconRatio = 0.75;

  final bool value;
  final VoidCallback onPressed;
  final double size;
  final Color borderColor;
  final double borderWidth;

  const AppCheckbox(
    this.value, {
    required this.onPressed,
    this.size = 32.0,
    this.borderColor = AppColors.gray200,
    this.borderWidth = 3.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: value ? AppColors.primary : null,
          borderRadius: borderRadius8,
          border: Border.all(
            color: value ? Colors.transparent : borderColor,
            width: borderWidth,
          ),
        ),
        child: Icon(
          Icons.check_rounded,
          size: size * checkIconRatio,
          color: value ? Colors.white : Colors.transparent,
        ),
      ),
    );
  }
}

class SmallCheckbox extends AppCheckbox {
  const SmallCheckbox(
    super.value, {
    super.key,
    super.size = 24.0,
    super.borderColor = AppColors.grey800,
    super.borderWidth = 1.5,
    required super.onPressed,
  });
}
