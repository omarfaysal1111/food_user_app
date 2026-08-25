class CompleteProfileArgs {
  final String registrationToken;
  final List<String> requiredFields;

  const CompleteProfileArgs({
    required this.registrationToken,
    required this.requiredFields,
  });
}
