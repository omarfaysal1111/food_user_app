import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/market_category.dart';
import '../repositories/market_repository.dart';

class GetMarketCategoriesUseCase
    implements UseCase<List<MarketCategory>, String> {
  final MarketRepository repository;

  GetMarketCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<MarketCategory>>> call(String marketId) {
    return repository.getMarketCategories(marketId);
  }
}
