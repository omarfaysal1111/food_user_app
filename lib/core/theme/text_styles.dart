import 'package:flutter/material.dart';
import 'package:food_user_app/core/theme/app_colors.dart';

/// Typography. Styles that vary with brightness take [BuildContext].
class AppTextStyles {
  AppTextStyles._();

  static const String _fontFamily = 'ExpoArabic';

  static TextStyle heading1(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface(context),
      );

  static TextStyle textFieldHeading(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.onSurface(context),
      );

  static TextStyle buttonHeading(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurface(context),
      );

  static TextStyle heading4(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface(context),
      );

  static TextStyle body(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurface(context),
      );

  static TextStyle caption(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        color: AppColors.paragraph(context),
        fontWeight: FontWeight.w400,
      );

  static TextStyle textFieldTitle(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.onSurface(context),
        height: 1.4,
      );

  static TextStyle screenTitle(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface(context),
        height: 1.4,
      );

  static TextStyle onboardingTitleAccent(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
        height: 1.4,
      );

  static TextStyle onboardingDescription(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColors.paragraph(context),
        height: 1.3,
      );

  static TextStyle textLink(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurface(context),
      );

  static TextStyle subtitle(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.paragraph(context),
        height: 1.3,
      );

  static const richTextBase12 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    height: 1.3,
  );

  static TextStyle termsMuted(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        color: AppColors.paragraph(context),
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

  static TextStyle footerSecondary(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        color: AppColors.paragraph(context),
        height: 1.35,
      );

  static const linkEmphasis = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    color: AppColors.primary,
    fontWeight: FontWeight.w600,
    height: 1.25,
  );

  static TextStyle resendActionDisabled(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        color: AppColors.paragraph(context),
        fontWeight: FontWeight.w600,
        height: 1.25,
      );

  static TextStyle fieldLabel(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        color: AppColors.onSurface(context),
        height: 1.35,
      );

  static TextStyle inputHint(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        color: AppColors.hint(context),
        height: 1.3,
      );

  static TextStyle inputText(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        color: AppColors.onSurface(context),
        fontWeight: FontWeight.w400,
      );

  static TextStyle otpDigitActive(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        color: AppColors.onSurface(context),
        height: 1.3,
      );

  static TextStyle otpDigitInactive(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        color: AppColors.paragraph(context),
        height: 1.3,
      );

  static const hiddenOtpInput = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 1,
    height: 1,
    color: AppColors.transparent,
  );

  static TextStyle timerText(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        color: AppColors.paragraph(context),
        height: 1.35,
      );

  static TextStyle textLinkUnderline(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurface(context),
        decoration: TextDecoration.underline,
        decorationColor: AppColors.onSurface(context),
        decorationThickness: 1.2,
      );

  static TextStyle languageChipLabel(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        color: AppColors.onSurface(context),
      );

  static TextStyle dividerLabel(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        color: AppColors.paragraph(context),
      );

  static TextStyle socialButtonLabel(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        color: AppColors.onSurface(context),
        fontWeight: FontWeight.w500,
      );

  static const primaryButtonLabel = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );

  static TextStyle appBarTitle(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface(context),
      );

  static TextStyle termsBody(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.onSurface(context),
        height: 1.45,
      );

  static TextStyle homeHeadline(BuildContext context) => TextStyle(
        fontFamily: _fontFamily,
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface(context),
      );

  static TextStyle snackBarMessage(BuildContext context) {
    final base = Theme.of(context).snackBarTheme.contentTextStyle;
    return TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: base?.color ?? AppColors.onSurface(context),
    );
  }
}
