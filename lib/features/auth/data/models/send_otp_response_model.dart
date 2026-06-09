/// Parsed `POST /api/v2/auth/otp/send` response.
///
/// The backend may include [otp] in the body while mail delivery is not
/// implemented. The app must not rely on or auto-fill this value — users
/// enter the OTP manually once email delivery is live.
class SendOtpResponseModel {
  final String? otp;
  final String message;

  const SendOtpResponseModel({this.otp, this.message = ''});

  factory SendOtpResponseModel.fromJson(Map<String, dynamic> json) {
    final otpValue = json['otp'];
    return SendOtpResponseModel(
      otp: otpValue?.toString(),
      message: json['message']?.toString() ?? '',
    );
  }
}
