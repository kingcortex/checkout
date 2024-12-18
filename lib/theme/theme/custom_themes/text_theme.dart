import 'package:flutter/material.dart';

import '../color.dart';

class MyTextTheme {
  MyTextTheme._();

  static TextTheme textTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32,
        fontWeight: FontWeight.normal,
        color: AppColors.defaultFont),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: AppColors.defaultFont),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.defaultFont),
    titleLarge: const TextStyle().copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: AppColors.defaultFont),
    titleMedium: const TextStyle().copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.defaultFont),
    titleSmall: const TextStyle().copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.defaultFont),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.defaultFont),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.defaultFont),
    bodySmall: const TextStyle().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.defaultFont),
  );
}
