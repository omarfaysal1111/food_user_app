class ApiResponse<T> {
  final T? data;
  final String? message;
  final bool success;

  const ApiResponse({required this.success, this.data, this.message});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    // TODO: implement
    throw UnimplementedError();
  }
}
