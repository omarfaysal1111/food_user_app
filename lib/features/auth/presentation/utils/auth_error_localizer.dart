import 'package:food_user_app/l10n/app_localizations.dart';

String localizedAuthError(AppLocalizations l10n, String message) {
  return switch (message) {
    'No internet connection' => l10n.authErrorNoInternet,
    'Request timed out' => l10n.authErrorTimeout,
    'Unauthorized' => l10n.authErrorUnauthorized,
    'Something went wrong' => l10n.authErrorUnknown,
    'Request failed' => l10n.authErrorRequestFailed,
    'Invalid response' => l10n.authErrorInvalidResponse,
    'Verification succeeded but no access token was returned' =>
      l10n.authErrorMissingAccessToken,
    _ => message,
  };
}
