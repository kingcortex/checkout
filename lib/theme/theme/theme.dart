import 'package:checkout/theme/theme/color.dart';
import 'package:flutter/material.dart';
import 'custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      textTheme: MyTextTheme.textTheme,
      scaffoldBackgroundColor: AppColors.defaultBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.defaultBackground,
      ));
}
