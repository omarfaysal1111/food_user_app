import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/checkout/domain/entities/address.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetSavedAddressesUseCase extends UseCase<List<Address>, NoParams> {
  // TODO: inject repository

  @override
  Future<Either<Failure, List<Address>>> call(NoParams params) {
    // TODO: implement
    throw UnimplementedError();
  }
}
