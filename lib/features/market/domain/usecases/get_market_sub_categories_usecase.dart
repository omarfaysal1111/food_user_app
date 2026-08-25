import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/market_sub_category.dart';
import '../repositories/market_repository.dart';

class GetMarketSubCategoriesParams extends Equatable {
  final String marketId;
  final String categoryId;

  const GetMarketSubCategoriesParams({
    required this.marketId,
    required this.categoryId,
  });

  @override
  List<Object?> get props => [marketId, categoryId];
}

class GetMarketSubCategoriesUseCase
    implements UseCase<List<MarketSubCategory>, GetMarketSubCategoriesParams> {
  final MarketRepository repository;

  GetMarketSubCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<MarketSubCategory>>> call(
    GetMarketSubCategoriesParams params,
  ) {
    return repository.getMarketSubCategories(
      marketId: params.marketId,
      categoryId: params.categoryId,
    );
  }
}
