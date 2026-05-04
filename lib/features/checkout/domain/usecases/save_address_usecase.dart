import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/checkout/domain/entities/address.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class SaveAddressUseCase extends UseCase<Address, NoParams> {
  // TODO: inject repository

  @override
  Future<Either<Failure, Address>> call(NoParams params) {
    // TODO: implement
    throw UnimplementedError();
  }
}
