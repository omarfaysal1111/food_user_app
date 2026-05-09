// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Food User App';

  @override
  String get changeAppLanguageTitle => 'Change App Language';

  @override
  String get languageArabic => 'Arabic';

  @override
  String get languageEnglish => 'English';

  @override
  String get loginTitle => 'Sign in!';

  @override
  String get loginSubtitle => 'Welcome back — sign in to continue.';

  @override
  String get loginEmailLabel => 'Email';

  @override
  String get loginEmailHint => 'Email';

  @override
  String get loginPasswordLabel => 'Password';

  @override
  String get loginPasswordHint => 'Password';

  @override
  String get loginForgotPassword => 'Forgot password?';

  @override
  String get loginSubmit => 'Sign in';

  @override
  String get loginSubmitting => '…';

  @override
  String get loginNoAccount => 'Don\'t have an account? ';

  @override
  String get loginCreateAccount => 'Create account';

  @override
  String get registerWelcomeTitle => 'Welcome!';

  @override
  String get registerWelcomeSubtitle =>
      'Join us today and enjoy faster delivery.';

  @override
  String get registerUsernameLabel => 'Username';

  @override
  String get registerUsernameHint => 'Username';

  @override
  String get registerPhoneLabel => 'Mobile number';

  @override
  String get registerPhoneHint => 'Mobile number';

  @override
  String get registerEmailLabel => 'Email';

  @override
  String get registerEmailHint => 'Email';

  @override
  String get registerPasswordLabel => 'Password';

  @override
  String get registerPasswordHint => 'Password';

  @override
  String get registerConfirmPasswordLabel => 'Confirm password';

  @override
  String get registerConfirmPasswordHint => 'Confirm password';

  @override
  String get registerTermsPrefix => 'I agree to the ';

  @override
  String get registerTermsLink => 'Terms & Conditions';

  @override
  String get registerTermsError => 'You must accept the Terms & Conditions.';

  @override
  String get registerSubmit => 'Create account';

  @override
  String get registerHasAccount => 'Already have an account? ';

  @override
  String get registerSignIn => 'Sign in';

  @override
  String get forgotPasswordTitle => 'Forgot password!';

  @override
  String get forgotPasswordSubtitle =>
      'Enter your email so we can verify your account.';

  @override
  String get forgotPasswordSubmit => 'Confirm';

  @override
  String get resetPasswordTitle => 'Reset password!';

  @override
  String get resetPasswordSubtitle =>
      'Enter a new password to keep your data secure.';

  @override
  String get resetPasswordSubmit => 'Confirm';

  @override
  String get otpTitle => 'Verification code';

  @override
  String get otpSubtitle =>
      'Enter the code sent to you to confirm your mobile number and continue.';

  @override
  String get otpVerify => 'Verify';

  @override
  String otpTimerSeconds(int seconds) {
    return '${seconds}s';
  }

  @override
  String get otpResend => 'Resend code?';

  @override
  String get otpResentSnackbar => 'Code sent again';

  @override
  String get termsTitle => 'Terms & Conditions';

  @override
  String get termsBody =>
      'This is the Terms & Conditions page for the app. By using this app, you agree to follow the usage policies, respect platform rules, and keep your account information confidential. This page will be updated with final legal content later.';

  @override
  String get onboardingTitleLine1 => 'Order more, wait less …';

  @override
  String get onboardingTitleAccent => ' Order now';

  @override
  String get onboardingDescription =>
      'Faster delivery, more options, and an experience designed\nfor your comfort with every order.';

  @override
  String get onboardingCta => 'Start now';

  @override
  String get socialDivider => 'or';

  @override
  String get socialAppleSoon => 'Sign in with Apple is coming soon';

  @override
  String get socialGoogleSoon => 'Sign in with Google is coming soon';

  @override
  String get socialAppleLabel => 'Sign in with Apple';

  @override
  String get socialGoogleLabel => 'Sign in with Google';

  @override
  String get validationEmailRequiredDotComRequired => 'Email is required';

  @override
  String get validationEmailRequiredDotComInvalid =>
      'Please enter a valid email address';

  @override
  String get validationEmailRequiredDotComNeedsCom =>
      'Email must end with .com';

  @override
  String get validationPasswordRequired => 'Password is required';

  @override
  String get validationPasswordMin8 => 'Password must be at least 8 characters';

  @override
  String get validationUsernameRequired => 'Username is required';

  @override
  String get validationUsernameMin3 => 'Username must be at least 3 characters';

  @override
  String get validationPhoneRequired => 'Mobile number is required';

  @override
  String get validationPhoneEgyptian =>
      'Please enter a valid Egyptian mobile number (10 or 11 digits after +20)';

  @override
  String get validationConfirmPasswordRequired =>
      'Password confirmation is required';

  @override
  String get validationConfirmPasswordMismatch => 'Passwords do not match';

  @override
  String get validationOtpRequired => 'Verification code is required';

  @override
  String get validationOtpSixDigits => 'Please enter 6 digits';
}
