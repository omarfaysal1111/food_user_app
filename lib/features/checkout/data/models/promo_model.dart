import 'package:food_user_app/features/checkout/domain/entities/promo.dart';

class PromoModel extends Promo {
  const PromoModel() : super();

  factory PromoModel.fromJson(Map<String, dynamic> json) {
    return const PromoModel();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
