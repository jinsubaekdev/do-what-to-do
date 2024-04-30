import 'package:do_what_to_do/common/const/colors.dart';
import 'package:do_what_to_do/common/const/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final VoidCallback? onPressed;

  const RoundedContainer({
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.grey800,
          border: Border.all(color: AppColors.grey600, width: 2),
          borderRadius: borderRadius16,
        ),
        padding: padding,
        child: child,
      ),
    );
  }
}
