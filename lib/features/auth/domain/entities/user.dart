class User {
  final String id;
  final String name;
  final String? email;
  final String? phone;
  final String? role;

  const User({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    this.role,
  });
}
