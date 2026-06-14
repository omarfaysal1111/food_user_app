/// Shared validation rules for auth flows. Pass localized messages from
/// [AppLocalizations] at the call site.
class AuthValidators {
  AuthValidators._();

  static String? emailRequiredDotCom(
    String? value, {
    required String requiredMessage,
    required String invalidMessage,
    required String dotComMessage,
  }) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return requiredMessage;
    }
    final basic = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!basic.hasMatch(email)) {
      return invalidMessage;
    }
    if (!email.toLowerCase().endsWith('.com')) {
      return dotComMessage;
    }
    return null;
  }

  static String? passwordRequiredMin8(
    String? value, {
    required String requiredMessage,
    required String minMessage,
  }) {
    final password = value ?? '';
    if (password.isEmpty) {
      return requiredMessage;
    }
    if (password.length < 8) {
      return minMessage;
    }
    return null;
  }

  static String? usernameRegister(
    String? value, {
    required String requiredMessage,
    required String minMessage,
  }) {
    final name = value?.trim() ?? '';
    if (name.isEmpty) {
      return requiredMessage;
    }
    if (name.length < 3) {
      return minMessage;
    }
    return null;
  }

  /// Egyptian mobile: user types local number with optional leading 0.
  static String? egyptianPhone(
    String? value, {
    required String requiredMessage,
    required String invalidMessage,
  }) {
    var digits = (value ?? '').replaceAll(RegExp(r'\D'), '');
    if (digits.isEmpty) {
      return requiredMessage;
    }
    if (digits.startsWith('20') && digits.length >= 12) {
      digits = digits.substring(2);
    }
    if (digits.length == 11 && digits.startsWith('01')) {
      return null;
    }
    if (digits.length == 10 && digits.startsWith('1')) {
      return null;
    }
    return invalidMessage;
  }

  static String? confirmPassword(
    String? confirm,
    String password, {
    required String requiredMessage,
    required String mismatchMessage,
  }) {
    final c = confirm ?? '';
    if (c.isEmpty) {
      return requiredMessage;
    }
    if (c != password) {
      return mismatchMessage;
    }
    return null;
  }

  static String? otpSixDigits(
    String? value, {
    required String requiredMessage,
    required String invalidMessage,
  }) {
    final s = (value ?? '').trim();
    if (s.isEmpty) {
      return requiredMessage;
    }
    if (s.length != 6 || RegExp(r'\D').hasMatch(s)) {
      return invalidMessage;
    }
    return null;
  }
}
