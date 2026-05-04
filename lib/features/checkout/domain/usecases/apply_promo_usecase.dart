import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/checkout/domain/entities/promo.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class ApplyPromoUseCase extends UseCase<Promo, NoParams> {
  // TODO: inject repository

  @override
  Future<Either<Failure, Promo>> call(NoParams params) {
    // TODO: implement
    throw UnimplementedError();
  }
}
