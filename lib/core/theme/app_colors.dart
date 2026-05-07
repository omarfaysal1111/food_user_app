import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const primary = Color(0xFFA3090F);
  static const text = Color(0xFFFFFFFF);
  static const paragraph = Color(0xFFA7A7A7);
  static const secondary = Color(0xFF2EC4B6);
  static const surface = Color(0xFFF8F9FA);
  static const error = Color(0xFFEC2D30);
  static const success = Color(0xFF0C9D61);
  static const warning = Color(0xFFF1D060);

  /// Primary text on light backgrounds (headings, labels).
  static const onSurface = Color(0xFF1B1B1B);

  /// Subtle borders, dividers, inactive outlines.
  static const border = Color(0xFFE5E5E5);

  /// Hint and placeholder text.
  static const hint = Color(0xFFB9B9B9);

  /// Auth and light scaffold backgrounds.
  static const scaffoldBackground = Color(0xFFFAFAFA);

  /// Cards, text fields, elevated surfaces (white).
  static const surfaceCard = Color(0xFFFFFFFF);

  /// Strong focus border for OTP cells.
  static const otpActiveBorder = Color(0xFF141414);

  /// Text field validation / error outline.
  static const fieldError = Color(0xFFE63946);

  /// Placeholder strip when no flag asset (e.g. language chip).
  static const flagRed = Color(0xFFCE1126);

  /// Fully transparent (e.g. Material parent for InkWell ripple).
  static const transparent = Color(0x00000000);

  // TODO: expand palette
}
