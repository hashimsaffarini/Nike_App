import 'package:flutter/material.dart';
import 'package:nike_app/utils/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
      ),
      useMaterial3: true,
    );
  }
}
