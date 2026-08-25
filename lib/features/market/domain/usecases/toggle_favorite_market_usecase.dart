import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/market_repository.dart';

class ToggleFavoriteMarketUseCase implements UseCase<bool, String> {
  final MarketRepository repository;

  ToggleFavoriteMarketUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(String marketId) {
    return repository.toggleFavoriteMarket(marketId);
  }
}
