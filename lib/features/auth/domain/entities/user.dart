class User {
  final String id;
  final String name;
  final String? email;
  final String? role;

  const User({
    required this.id,
    required this.name,
    this.email,
    this.role,
  });
}
