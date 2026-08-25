class SaveCardRequestDto {
  final String cardNumber;
  final String expiryDate;
  final String cvv;
  final int isDefault;

  const SaveCardRequestDto({
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    this.isDefault = 1,
  });

  Map<String, dynamic> toJson() {
    return {
      'card_number': cardNumber,
      'expiry_date': expiryDate,
      'cvv': cvv,
      'is_default': isDefault,
    };
  }
}
