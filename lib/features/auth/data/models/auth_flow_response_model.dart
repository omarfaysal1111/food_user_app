import 'auth_response_model.dart';

/// Parsed response from `POST /api/v1/auth/phone/verify-otp`.
///
/// The new API uses a `status` field inside `data` to differentiate:
///
/// **Case 1 — Existing user (`status == "authenticated"`)**:
/// ```json
/// {
///   "status": 200,
///   "msg": "Login successful",
///   "data": {
///     "status": "authenticated",
///     "access_token": "...",
///     "user": { ... }
///   }
/// }
/// ```
///
/// **Case 2 — New user (`status == "complete_profile"`)**:
/// ```json
/// {
///   "status": 200,
///   "msg": "OTP verified",
///   "data": {
///     "status": "complete_profile",
///     "registration_token": "...",
///     "required_fields": ["first_name", "last_name", "email"]
///   }
/// }
/// ```
class AuthFlowResponseModel {
  /// `"authenticated"` or `"complete_profile"`.
  final String status;

  /// Present only when [status] == `"authenticated"`.
  final AuthResponseModel? authResponse;

  /// Present only when [status] == `"complete_profile"`.
  final String? registrationToken;

  /// Present only when [status] == `"complete_profile"`.
  final List<String>? requiredFields;

  const AuthFlowResponseModel({
    required this.status,
    this.authResponse,
    this.registrationToken,
    this.requiredFields,
  });

  bool get isAuthenticated => status == 'authenticated';
  bool get needsProfileCompletion => status == 'complete_profile';
  bool get needsPhoneVerification => status == 'verify_phone';

  /// Parses from the **inner** `data` object of the API envelope.
  factory AuthFlowResponseModel.fromDataJson(Map<String, dynamic> data) {
    final status = data['status']?.toString() ?? '';

    if (status == 'authenticated') {
      return AuthFlowResponseModel(
        status: status,
        authResponse: AuthResponseModel.fromJson(data),
      );
    }

    if (status == 'verify_phone') {
      return AuthFlowResponseModel(
        status: status,
        registrationToken: data['registration_token']?.toString(),
      );
    }

    // fallback / default to complete_profile for backwards compatibility
    final rawFields = data['required_fields'];
    final fields = rawFields is List
        ? rawFields.map((e) => e.toString()).toList()
        : <String>[];

    return AuthFlowResponseModel(
      status: status.isNotEmpty ? status : 'complete_profile',
      registrationToken: data['registration_token']?.toString(),
      requiredFields: fields,
    );
  }
}
