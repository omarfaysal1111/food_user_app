import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static const _fontFamily = 'ExpoArabic';

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: _fontFamily,
    scaffoldBackgroundColor: const Color(0xFFFAFAFA),
    hintColor: const Color(0xFFB9B9B9),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.text,
      secondary: AppColors.secondary,
      onSecondary: Color(0xFF1B1B1B),
      error: AppColors.error,
      onError: AppColors.text,
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF1B1B1B),
      onSurfaceVariant: Color(0xFFA7A7A7),
      outline: Color(0xFFE5E5E5),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color(0xFFFFFFFF),
      contentTextStyle: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xFF1B1B1B),
      ),
      behavior: SnackBarBehavior.floating,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xFF1B1B1B),
    ),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: _fontFamily,
    scaffoldBackgroundColor: const Color(0xFF080404),
    hintColor: const Color(0xFF515151),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: AppColors.text,
      secondary: AppColors.secondary,
      onSecondary: Color(0xFF080404),
      error: AppColors.error,
      onError: AppColors.text,
      surface: Color(0xFF0F0F0F),
      onSurface: Color(0xFFFFFFFF),
      onSurfaceVariant: Color(0xFF999999),
      outline: Color(0xFF141414),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color(0xFF1A1A1A),
      contentTextStyle: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xFFFFFFFF),
      ),
      behavior: SnackBarBehavior.floating,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xFFFFFFFF),
    ),
  );
}
