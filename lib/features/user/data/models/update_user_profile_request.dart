class UpdateUserProfileRequest {
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? email;
  final String? avatar;
  final String? locale;

  const UpdateUserProfileRequest({
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.avatar,
    this.locale,
  });

  Map<String, dynamic> toJson() {
    return {
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (avatar != null) 'avatar': avatar,
      if (locale != null) 'locale': locale,
    };
  }
}
