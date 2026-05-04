import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/notifications/domain/entities/notification.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetNotificationsUseCase extends UseCase<List<AppNotification>, NoParams> {
  // TODO: inject repository

  @override
  Future<Either<Failure, List<AppNotification>>> call(NoParams params) {
    // TODO: implement
    throw UnimplementedError();
  }
}
