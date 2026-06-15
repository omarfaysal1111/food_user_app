import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:food_user_app/core/constants/api_endpoints.dart';
import 'package:food_user_app/core/network/dio_error_mapper.dart';
import 'package:food_user_app/core/errors/exceptions.dart';
import 'package:food_user_app/features/auth/data/models/auth_response_model.dart';
import 'package:food_user_app/features/auth/data/models/send_otp_response_model.dart';
import 'package:food_user_app/features/auth/data/models/verify_otp_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  });

  Future<AuthResponseModel> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    String role,
  });

  /// Sends an OTP to the given email for the forgot-password flow.
  /// Backend contract: `POST /api/v2/auth/otp/send` with `{ email, role }`.
  Future<void> sendOtp({required String email, String role});

  /// Verifies an OTP previously sent to [email].
  /// Backend contract: `POST /api/v2/auth/otp/verify` with `{ email, otp }`.
  /// `role` is intentionally NOT sent — the endpoint only accepts email + otp.
  ///
  /// When the backend returns a (short-lived) access token alongside the
  /// success response, it is captured in the returned model so the repository
  /// can persist it before the immediately-following set-password call.
  Future<VerifyOtpResponseModel> verifyOtp({
    required String email,
    required String otp,
  });

  /// Sets a new password for the currently authenticated user.
  /// Backend contract: `POST /api/v2/auth/set-password` with `{ newPassword }`.
  /// Requires a Bearer token — attached by [AuthInterceptor].
  Future<void> setPassword({required String newPassword});

  /// `Authorization: Bearer` is attached by [AuthInterceptor]; do not set it
  /// here. Body must include the refresh token per API contract.
  Future<void> logout({required String refreshToken});

  // ── Unified phone login/register (API v2) ──────────────────────────────────

  /// Sends a 6-digit OTP to [phone] for the unified flow.
  /// Backend: `POST /api/v2/auth/otp/send` `{ phone }`. Never fails for an
  /// unknown phone — the same call serves login and sign-up. The response
  /// carries `isExistingUser` as a UI hint.
  Future<SendOtpResponseModel> sendPhoneOtp({required String phone});

  /// Verifies the OTP for [phone].
  /// Backend: `POST /api/v2/auth/otp/verify` `{ phone, otp }`.
  /// Existing account → tokens (`newUser:false`). New phone → null tokens and
  /// `newUser:true`. This does NOT throw when there is no token.
  Future<AuthResponseModel> verifyPhoneOtp({
    required String phone,
    required String otp,
  });

  /// Completes sign-up for a freshly-verified [phone].
  /// Backend: `POST /api/v2/auth/register` `{ phone, firstName, lastName, email? }`.
  Future<AuthResponseModel> completeRegistration({
    required String phone,
    required String firstName,
    required String lastName,
    String? email,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        ApiEndpoints.login,
        data: <String, dynamic>{'email': email, 'password': password},
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const ServerException('Invalid response');
      }
      return AuthResponseModel.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<AuthResponseModel> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    String role = 'ROLE_CUSTOMER',
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        ApiEndpoints.register,
        data: <String, dynamic>{
          'name': name,
          'email': email,
          'password': password,
          'role': role,
          'phone': _toEgyptianE164(phone),
        },
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const ServerException('Invalid response');
      }
      return AuthResponseModel.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  /// Normalizes an Egyptian mobile number to E.164 (`+20XXXXXXXXXX`).
  /// Accepts inputs like `01012345678`, `1012345678`, `201012345678`,
  /// or `+201012345678` (with optional spaces).
  static String _toEgyptianE164(String raw) {
    var digits = raw.replaceAll(RegExp(r'\D'), '');
    if (digits.startsWith('20')) {
      digits = digits.substring(2);
    }
    if (digits.startsWith('0')) {
      digits = digits.substring(1);
    }
    return '+20$digits';
  }

  @override
  Future<void> sendOtp({
    required String email,
    String role = 'ROLE_CUSTOMER',
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        ApiEndpoints.passwordRecoveryUrl(ApiEndpoints.sendOtp),
        data: <String, dynamic>{'email': email, 'role': role},
      );
      final raw = response.data;
      if (raw is Map<String, dynamic>) {
        final parsed = SendOtpResponseModel.fromJson(raw);
        // Dev-only: mail is not live yet, so the API may return OTP in the body.
        if (kDebugMode) {
          debugPrint('[Send OTP] status: ${response.statusCode}');
          debugPrint('[Send OTP] response: $raw');
          debugPrint('[Send OTP] message: ${parsed.message}');
          if (parsed.otp != null) {
            debugPrint('[Send OTP] otp: ${parsed.otp}');
          }
        }
      } else if (kDebugMode) {
        debugPrint('[Send OTP] status: ${response.statusCode}');
        debugPrint('[Send OTP] response: $raw');
      }
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<VerifyOtpResponseModel> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        ApiEndpoints.passwordRecoveryUrl(ApiEndpoints.verifyOtp),
        data: <String, dynamic>{'email': email, 'otp': otp},
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const ServerException('Invalid response');
      }
      final model = VerifyOtpResponseModel.fromJson(raw);
      if (!model.hasAccessToken) {
        throw const ServerException(
          'Verification succeeded but no access token was returned',
        );
      }
      return model;
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<void> setPassword({required String newPassword}) async {
    try {
      await _dio.post<dynamic>(
        ApiEndpoints.passwordRecoveryUrl(ApiEndpoints.setPassword),
        data: <String, dynamic>{'newPassword': newPassword},
      );
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<void> logout({required String refreshToken}) async {
    try {
      await _dio.post<dynamic>(
        ApiEndpoints.logout,
        data: <String, dynamic>{'refreshToken': refreshToken},
      );
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  // ── Unified phone login/register (API v2) ──────────────────────────────────

  @override
  Future<SendOtpResponseModel> sendPhoneOtp({required String phone}) async {
    try {
      final response = await _dio.post<dynamic>(
        ApiEndpoints.v2(ApiEndpoints.sendOtp),
        data: <String, dynamic>{'phone': _toEgyptianE164(phone)},
      );
      final raw = response.data;
      if (raw is Map<String, dynamic>) {
        return SendOtpResponseModel.fromJson(raw);
      }
      return const SendOtpResponseModel();
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<AuthResponseModel> verifyPhoneOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        ApiEndpoints.v2(ApiEndpoints.verifyOtp),
        data: <String, dynamic>{'phone': _toEgyptianE164(phone), 'otp': otp},
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const ServerException('Invalid response');
      }
      // Do NOT require a token here: a new phone returns null tokens +
      // newUser:true and must be allowed through to the register step.
      return AuthResponseModel.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<AuthResponseModel> completeRegistration({
    required String phone,
    required String firstName,
    required String lastName,
    String? email,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        ApiEndpoints.v2(ApiEndpoints.registerV2),
        data: <String, dynamic>{
          'phone': _toEgyptianE164(phone),
          'firstName': firstName,
          'lastName': lastName,
          if (email != null && email.trim().isNotEmpty) 'email': email.trim(),
        },
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const ServerException('Invalid response');
      }
      return AuthResponseModel.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
