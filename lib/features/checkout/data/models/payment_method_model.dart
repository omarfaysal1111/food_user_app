import 'package:food_user_app/features/checkout/domain/entities/payment_method.dart';

class PaymentMethodModel extends PaymentMethod {
  const PaymentMethodModel({
    required super.id,
    super.gateway,
    super.brand,
    super.last4,
    super.expMonth,
    super.expYear,
    super.isDefault,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      id: json['id'] as String,
      gateway: json['gateway'] as String?,
      brand: json['brand'] as String?,
      last4: json['last4'] as String?,
      expMonth: json['expMonth'] as int?,
      expYear: json['expYear'] as int?,
      isDefault: json['default'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'gateway': gateway,
      'brand': brand,
      'last4': last4,
      'expMonth': expMonth,
      'expYear': expYear,
      'default': isDefault,
    };
  }
}
