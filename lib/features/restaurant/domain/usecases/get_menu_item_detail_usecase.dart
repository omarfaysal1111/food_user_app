import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/restaurant/domain/entities/menu_item.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetMenuItemDetailUseCase extends UseCase<MenuItem, NoParams> {
  // TODO: inject repository

  @override
  Future<Either<Failure, MenuItem>> call(NoParams params) {
    // TODO: implement
    throw UnimplementedError();
  }
}
