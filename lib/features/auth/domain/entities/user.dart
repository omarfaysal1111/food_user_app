class User {
  final String id;

  /// Composed display name (full_name from API, or first + last).
  final String name;

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;

  /// Social/auth provider (e.g. "phone", "google", "apple", "facebook").
  final String? authProvider;

  /// Whether push notifications are enabled for this user.
  final bool? isNotify;

  // Kept for backward-compat with old code that checks role
  final String? role;

  const User({
    required this.id,
    required this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.authProvider,
    this.isNotify,
    this.role,
  });
}
