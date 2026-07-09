import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/cart/domain/entities/cart.dart';
import 'package:food_user_app/features/cart/domain/repositories/cart_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetCartUseCase extends UseCase<Cart, NoParams> {
  final CartRepository repository;

  GetCartUseCase({required this.repository});

  @override
  Future<Either<Failure, Cart>> call(NoParams params) async {
    return await repository.getCart();
  }
}
