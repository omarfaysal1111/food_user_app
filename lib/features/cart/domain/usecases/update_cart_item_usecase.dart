import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/cart/domain/entities/cart_item.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class UpdateCartItemUseCase extends UseCase<CartItem, NoParams> {
  // TODO: inject repository

  @override
  Future<Either<Failure, CartItem>> call(NoParams params) {
    // TODO: implement
    throw UnimplementedError();
  }
}
