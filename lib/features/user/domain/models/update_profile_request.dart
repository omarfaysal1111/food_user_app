/// Pure domain value object for updating a user's profile.
/// ZERO dependencies on data layer.
class UpdateProfileRequest {
  const UpdateProfileRequest({
    this.firstName,
    this.lastName,
    this.email,
    this.avatar,
    this.locale,
  });

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? avatar;
  final String? locale;
}
