import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/market.dart';
import '../repositories/market_repository.dart';

class GetFavoriteMarketsUseCase implements UseCase<List<Market>, NoParams> {
  final MarketRepository repository;

  GetFavoriteMarketsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Market>>> call(NoParams params) {
    return repository.getFavoriteMarkets();
  }
}
