import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/market.dart';
import '../repositories/market_repository.dart';

class GetMarketDetailUseCase implements UseCase<Market, String> {
  final MarketRepository repository;

  GetMarketDetailUseCase(this.repository);

  @override
  Future<Either<Failure, Market>> call(String marketId) {
    return repository.getMarketDetail(marketId);
  }
}
