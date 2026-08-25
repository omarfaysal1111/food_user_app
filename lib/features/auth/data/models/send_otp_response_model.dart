/// Parsed response from `POST /api/v1/auth/phone/send-otp`.
///
/// New API shape (inside the outer `{ status, msg, data }` envelope):
/// ```json
/// {
///   "status": 200,
///   "msg": "OTP sent successfully",
///   "data": null
/// }
/// ```
/// The API simply returns 200 + msg; no extra data fields.
class SendOtpResponseModel {
  final String message;

  const SendOtpResponseModel({this.message = ''});

  factory SendOtpResponseModel.fromJson(Map<String, dynamic> json) {
    final msg = json['msg']?.toString() ?? json['message']?.toString() ?? '';
    return SendOtpResponseModel(message: msg);
  }
}
