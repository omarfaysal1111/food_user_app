import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/market_offer.dart';
import '../repositories/market_repository.dart';

class GetMarketOffersUseCase implements UseCase<List<MarketOffer>, String> {
  final MarketRepository repository;

  GetMarketOffersUseCase(this.repository);

  @override
  Future<Either<Failure, List<MarketOffer>>> call(String marketId) {
    return repository.getMarketOffers(marketId);
  }
}
