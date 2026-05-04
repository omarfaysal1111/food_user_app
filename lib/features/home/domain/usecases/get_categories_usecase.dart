import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/home/domain/entities/category.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetCategoriesUseCase extends UseCase<List<Category>, NoParams> {
  // TODO: inject repository

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) {
    // TODO: implement
    throw UnimplementedError();
  }
}
