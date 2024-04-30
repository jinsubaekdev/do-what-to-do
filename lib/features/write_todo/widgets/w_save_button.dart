import 'package:do_what_to_do/common/const/colors.dart';
import 'package:do_what_to_do/common/const/dimensions.dart';
import 'package:do_what_to_do/common/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SaveButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onPressed;

  const SaveButton({
    required this.enabled,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        height: 48.0,
        decoration: BoxDecoration(
          color: enabled ? Colors.white : AppColors.grey500,
          borderRadius: borderRadius16,
        ),
        alignment: Alignment.center,
        child: 'Save'.text.textStyle(AppTextTheme.md.semiBold).make(),
      ),
    );
  }
}
