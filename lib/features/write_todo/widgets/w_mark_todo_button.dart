import 'package:do_what_to_do/common/const/colors.dart';
import 'package:do_what_to_do/common/const/dimensions.dart';
import 'package:do_what_to_do/common/theme/app_theme.dart';
import 'package:do_what_to_do/common/widgets/w_rounded_container.dart';
import 'package:do_what_to_do/common/widgets/w_width_and_height.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MarkTodoButton extends StatelessWidget {
  static const rightPaddingValue = 24.0;

  final bool value;
  final VoidCallback onPressed;

  const MarkTodoButton({
    required this.value,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      onPressed: onPressed,
      child: Row(
        children: [
          _Checkbox(value),
          width4,
          'Mark as done'.text.textStyle(AppTextTheme.md.semiBold).white.make(),
        ],
      ).pOnly(right: rightPaddingValue),
    );
  }
}

class _Checkbox extends StatelessWidget {
  static const checkboxSize = 24.0;
  static const margin = EdgeInsets.all(4.0);
  static const checkIconSize = 18.0;
  static const checkboxWidth = 3.0;

  final bool value;

  const _Checkbox(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: checkboxSize,
      height: checkboxSize,
      margin: margin,
      decoration: BoxDecoration(
        color: value ? AppColors.grey400 : null,
        borderRadius: borderRadius8,
        border: Border.all(
          color: AppColors.grey400,
          width: checkboxWidth,
        ),
      ),
      child: Icon(
        Icons.check_rounded,
        size: checkIconSize,
        color: value ? Colors.black : Colors.transparent,
      ),
    );
  }
}
