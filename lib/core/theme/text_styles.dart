import 'package:flutter/material.dart';
import 'package:food_user_app/core/theme/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String _fontFamily = 'ExpoArabic';

  static const heading1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.onSurface,
  );

  static const textFieldHeading = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.onSurface,
  );

  static const buttonHeading = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.onSurface,
  );

  static const heading4 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.onSurface,
  );

  static const body = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.onSurface,
  );

  static const caption = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    color: AppColors.paragraph,
    fontWeight: FontWeight.w400,
  );

  /// Screen titles (auth headers).
  static const textFieldTitle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.onSurface,
    height: 1.4,
  );

  static const screenTitle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.onSurface,
    height: 1.4,
  );

  /// Onboarding headline accent segment (same scale as [screenTitle]).
  static const onboardingTitleAccent = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    height: 1.4,
  );

  /// Onboarding supporting paragraph under the title (Figma body Book; 13 for two lines on narrow widths).
  static const onboardingDescription = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.onboardingMuted,
    height: 1.3,
  );

  static const textLink = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.onSurface,
  );

  static const subtitle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.paragraph,
    height: 1.3,
  );

  static const richTextBase12 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    height: 1.3,
  );

  static const termsMuted = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    color: AppColors.paragraph,
    height: 1.3,
  );

  static const termsLink = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.primary,
    decorationThickness: 1.2,
    height: 1.3,
  );

  static const termsInlineError = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.error,
    height: 1.3,
  );

  /// Short validation line below custom fields (e.g. phone row).
  static const validationCaption = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.error,
    height: 1.3,
  );

  static const richTextBase14 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
  );

  static const footerSecondary = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    color: AppColors.paragraph,
    height: 1.35,
  );

  static const linkEmphasis = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    color: AppColors.primary,
    fontWeight: FontWeight.w600,
    height: 1.25,
  );

  /// Resend / secondary action when timer has not expired (muted).
  static const resendActionDisabled = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    color: AppColors.paragraph,
    fontWeight: FontWeight.w600,
    height: 1.25,
  );

  static const fieldLabel = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    color: AppColors.onSurface,
    height: 1.35,
  );

  static const inputHint = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    color: AppColors.hint,
    height: 1.3,
  );

  static const inputText = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    color: AppColors.onSurface,
    fontWeight: FontWeight.w400,
  );

  static const otpDigitActive = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    color: AppColors.onSurface,
    height: 1.3,
  );

  static const otpDigitInactive = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    color: AppColors.paragraph,
    height: 1.3,
  );

  static const timerText = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    color: AppColors.paragraph,
    height: 1.35,
  );

  static const textLinkUnderline = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.onSurface,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.onSurface,
    decorationThickness: 1.2,
  );

  static const languageChipLabel = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    color: AppColors.onSurface,
  );

  static const dividerLabel = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    color: AppColors.paragraph,
  );

  static const socialButtonLabel = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    color: AppColors.onSurface,
    fontWeight: FontWeight.w500,
  );

  static const primaryButtonLabel = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );

  static const appBarTitle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.onSurface,
  );

  static const termsBody = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.onSurface,
    height: 1.45,
  );

  static const homeHeadline = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.onSurface,
  );

  static const snackBarMessage = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.onSurface,
  );
}
