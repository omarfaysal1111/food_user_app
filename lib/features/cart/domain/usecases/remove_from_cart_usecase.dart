import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/cart/domain/entities/cart.dart';
import 'package:food_user_app/features/cart/domain/repositories/cart_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class RemoveFromCartUseCase extends UseCase<Cart, String> {
  final CartRepository repository;

  RemoveFromCartUseCase({required this.repository});

  @override
  Future<Either<Failure, Cart>> call(String itemId) async {
    return await repository.removeFromCart(itemId);
  }
}
