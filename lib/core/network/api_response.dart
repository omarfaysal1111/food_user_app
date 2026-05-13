/// Generic envelope parser for APIs that return:
/// `{ "success": bool, "message": "...", "data": {...} }`.
///
/// This is infrastructure only. Endpoints whose response is flat
/// (e.g. the current Register endpoint) should parse their JSON directly
/// instead of going through [ApiResponse].
class ApiResponse<T> {
  final T? data;
  final String? message;
  final bool success;

  const ApiResponse({
    required this.success,
    this.data,
    this.message,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) {
    final rawData = json['data'];
    return ApiResponse<T>(
      success: json['success'] == true,
      message: json['message']?.toString(),
      data: rawData == null ? null : fromJsonT(rawData),
    );
  }
}
