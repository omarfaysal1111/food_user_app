/// Shared validation rules for auth flows (Arabic error messages).
class AuthValidators {
  AuthValidators._();

  static String? emailRequiredDotCom(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return 'البريد الالكتروني مطلوب';
    }
    final basic = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!basic.hasMatch(email)) {
      return 'يرجى إدخال بريد الكتروني صحيح';
    }
    if (!email.toLowerCase().endsWith('.com')) {
      return 'يجب أن ينتهي البريد الالكتروني بـ .com';
    }
    return null;
  }

  static String? passwordRequiredMin8(String? value) {
    final password = value ?? '';
    if (password.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (password.length < 8) {
      return 'كلمة المرور يجب ألا تقل عن ٨ أحرف';
    }
    return null;
  }

  static String? usernameRegister(String? value) {
    final name = value?.trim() ?? '';
    if (name.isEmpty) {
      return 'اسم المستخدم مطلوب';
    }
    if (name.length < 3) {
      return 'اسم المستخدم يجب ألا يقل عن ٣ أحرف';
    }
    return null;
  }

  /// Egyptian mobile: user types local number with optional leading 0.
  /// Accepts 10 digits starting with 1, or 11 digits starting with 01, or full 12 digits with 20 prefix.
  static String? egyptianPhone(String? value) {
    var digits = (value ?? '').replaceAll(RegExp(r'\D'), '');
    if (digits.isEmpty) {
      return 'رقم الجوال مطلوب';
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
    return 'يرجى إدخال رقم جوال مصري صحيح (١٠ أو ١١ رقماً بعد +٢٠)';
  }

  static String? confirmPassword(String? confirm, String password) {
    final c = confirm ?? '';
    if (c.isEmpty) {
      return 'تأكيد كلمة المرور مطلوب';
    }
    if (c != password) {
      return 'كلمة المرور غير متطابقة';
    }
    return null;
  }

  static String? otpSixDigits(String? value) {
    final s = (value ?? '').trim();
    if (s.isEmpty) {
      return 'رمز التحقق مطلوب';
    }
    if (s.length != 6 || RegExp(r'\D').hasMatch(s)) {
      return 'يرجى إدخال ٦ أرقام';
    }
    return null;
  }
}
