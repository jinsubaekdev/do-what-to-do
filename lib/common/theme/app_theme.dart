import 'package:do_what_to_do/common/const/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: AppColors.primary,
    ),
    textTheme: TextTheme(bodyMedium: AppTextTheme.sm.regular),
    fontFamily: 'Pretendard',
  );
}

class AppTextTheme {
  static const _xsSize = 12.0;
  static const _smSize = 14.0;
  static const _mdSize = 16.0;
  static const _lgSize = 18.0;
  static const _xlSize = 20.0;

  static const _displayXsSize = 24.0;

  static const _regularStyle = TextStyle(fontWeight: FontWeight.w400);
  static const _mediumStyle = TextStyle(fontWeight: FontWeight.w500);
  static const _semiBoldStyle = TextStyle(fontWeight: FontWeight.w600);
  static const _boldStyle = TextStyle(fontWeight: FontWeight.w700);

  static final xs = TextWeight(
    regular: _regularStyle.copyWith(fontSize: _xsSize),
    medium: _mediumStyle.copyWith(fontSize: _xsSize),
    semiBold: _semiBoldStyle.copyWith(fontSize: _xsSize),
    bold: _boldStyle.copyWith(fontSize: _xsSize),
  );

  static final sm = TextWeight(
    regular: _regularStyle.copyWith(fontSize: _smSize),
    medium: _mediumStyle.copyWith(fontSize: _smSize),
    semiBold: _semiBoldStyle.copyWith(fontSize: _smSize),
    bold: _boldStyle.copyWith(fontSize: _smSize),
  );

  static final md = TextWeight(
    regular: _regularStyle.copyWith(fontSize: _mdSize),
    medium: _mediumStyle.copyWith(fontSize: _mdSize),
    semiBold: _semiBoldStyle.copyWith(fontSize: _mdSize),
    bold: _boldStyle.copyWith(fontSize: _mdSize),
  );

  static final lg = TextWeight(
    regular: _regularStyle.copyWith(fontSize: _lgSize),
    medium: _mediumStyle.copyWith(fontSize: _lgSize),
    semiBold: _semiBoldStyle.copyWith(fontSize: _lgSize),
    bold: _boldStyle.copyWith(fontSize: _lgSize),
  );

  static final xl = TextWeight(
    regular: _regularStyle.copyWith(fontSize: _xlSize),
    medium: _mediumStyle.copyWith(fontSize: _xlSize),
    semiBold: _semiBoldStyle.copyWith(fontSize: _xlSize),
    bold: _boldStyle.copyWith(fontSize: _xlSize),
  );

  static final displayXs = TextWeight(
    regular: _regularStyle.copyWith(fontSize: _displayXsSize),
    medium: _mediumStyle.copyWith(fontSize: _displayXsSize),
    semiBold: _semiBoldStyle.copyWith(fontSize: _displayXsSize),
    bold: _boldStyle.copyWith(fontSize: _displayXsSize),
  );
}

class TextWeight {
  TextStyle regular;
  TextStyle medium;
  TextStyle semiBold;
  TextStyle bold;

  TextWeight({
    required this.regular,
    required this.medium,
    required this.semiBold,
    required this.bold,
  });
}
