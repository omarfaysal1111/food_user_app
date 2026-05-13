import 'package:flutter/material.dart';

/// Brand and theme tokens. Surfaces and text tones use [BuildContext] so they
/// follow [ThemeMode.system] light/dark [ColorScheme].
class AppColors {
  AppColors._();

  // ── Brand (fixed) ─────────────────────────────────────────────────────────
  static const primary = Color(0xFFA3090F);
  static const text = Color(0xFFFFFFFF);
  static const secondary = Color(0xFF2EC4B6);
  static const error = Color(0xFFEC2D30);
  static const success = Color(0xFF0C9D61);
  static const warning = Color(0xFFF1D060);
  static const _neutralDarkStroke = Color(0xFF1A1A1A);

  /// Legacy neutral surface (non-auth); prefer [surfaceCard] in new code.
  static const surface = Color(0xFFF8F9FA);

  static const flagRed = Color(0xFFCE1126);
  static const transparent = Color(0x00000000);

  // ── Theme-aware (auth / onboarding / shared UI) ─────────────────────────────

  static Color onSurface(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface;

  static Color paragraph(BuildContext context) =>
      Theme.of(context).colorScheme.onSurfaceVariant;

  static Color scaffoldBackground(BuildContext context) =>
      Theme.of(context).scaffoldBackgroundColor;

  static Color surfaceCard(BuildContext context) =>
      Theme.of(context).colorScheme.surface;

  static Color border(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? _neutralDarkStroke
      : Theme.of(context).colorScheme.outline;

  static Color hint(BuildContext context) => Theme.of(context).hintColor;

  static Color fieldError(BuildContext context) =>
      Theme.of(context).colorScheme.error;

  /// Focus ring for text fields (Figma dark: white hairline).
  static Color fieldFocusBorder(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? text
      : onSurface(context);

  /// OTP cell when focused (light: dark border; dark: white).
  static Color otpActiveBorder(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? text
      : const Color(0xFF141414);

  /// Muted icons (e.g. password visibility).
  static Color iconMuted(BuildContext context) => hint(context);

  static Color cursor(BuildContext context) => onSurface(context);

  /// Dimmed scrim behind modals (e.g. language picker).
  static Color modalBarrierScrim(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45);

  /// Dialog/modal barrier (same scrim as [modalBarrierScrim]).
  static Color overlay(BuildContext context) => modalBarrierScrim(context);

  /// Centered language-picker card fill.
  static Color languageModalBackground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF080404)
        : const Color(0xFFFAFAFA);
  }

  /// Language-picker card outline; stronger in dark mode for separation.
  static Color languageModalBorder(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    if (Theme.of(context).brightness == Brightness.dark) {
      return _neutralDarkStroke;
    }
    return scheme.outline;
  }

  /// Dividers inside the language picker; clearer in dark mode.
  static Color languageModalDivider(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    if (Theme.of(context).brightness == Brightness.dark) {
      return _neutralDarkStroke;
    }
    return scheme.outline;
  }

  /// Dimmer behind the language picker in dark mode for contrast.
  static Color languageModalBarrier(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return isDark
        ? const Color(0x80000000)
        : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45);
  }
}
