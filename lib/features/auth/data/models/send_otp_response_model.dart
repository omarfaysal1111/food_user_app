/// Parsed `POST /api/v2/auth/otp/send` response.
///
/// The backend may include [otp] in the body while mail delivery is not
/// implemented. The app must not rely on or auto-fill this value — users
/// enter the OTP manually once email delivery is live.
class SendOtpResponseModel {
  final String? otp;
  final String message;

  /// True when the phone already has an account (unified flow hint:
  /// sign-in vs. sign-up). Null when the endpoint does not report it.
  final bool? isExistingUser;

  const SendOtpResponseModel({
    this.otp,
    this.message = '',
    this.isExistingUser,
  });

  factory SendOtpResponseModel.fromJson(Map<String, dynamic> json) {
    final otpValue = json['otp'];
    final existing = json['isExistingUser'];
    return SendOtpResponseModel(
      otp: otpValue?.toString(),
      message: json['message']?.toString() ?? '',
      isExistingUser: existing is bool ? existing : null,
    );
  }
}
