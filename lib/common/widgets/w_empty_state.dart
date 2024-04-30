import 'package:do_what_to_do/common/const/colors.dart';
import 'package:do_what_to_do/common/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class EmptyState extends StatelessWidget {
  static const imageSize = 180.0;
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              height: imageSize,
              width: imageSize,
              'asset/images/two_cards_icon.png',
            ),
            '해야할 일이 없네요.'.text.textStyle(AppTextTheme.xl.regular).color(AppColors.grey400).make(),
          ],
        ),
      ],
    );
  }
}
