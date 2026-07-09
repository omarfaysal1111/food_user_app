import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/cart/domain/repositories/cart_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class ClearCartUseCase extends UseCase<Unit, NoParams> {
  final CartRepository repository;

  ClearCartUseCase({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return await repository.clearCart();
  }
}
