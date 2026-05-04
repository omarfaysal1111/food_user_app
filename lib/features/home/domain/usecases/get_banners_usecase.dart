import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/home/domain/entities/banner.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetBannersUseCase extends UseCase<List<Banner>, NoParams> {
  // TODO: inject repository

  @override
  Future<Either<Failure, List<Banner>>> call(NoParams params) {
    // TODO: implement
    throw UnimplementedError();
  }
}
