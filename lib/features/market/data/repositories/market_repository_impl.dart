import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/market.dart';
import '../../domain/entities/market_category.dart';
import '../../domain/entities/market_offer.dart';
import '../../domain/entities/market_sub_category.dart';
import '../../domain/entities/page_response_market.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/market_repository.dart';
import '../datasources/market_remote_data_source.dart';

class MarketRepositoryImpl implements MarketRepository {
  final MarketRemoteDataSource remoteDataSource;

  MarketRepositoryImpl({required this.remoteDataSource});

  Failure _mapExceptionToFailure(Object e) {
    if (e is UnauthorizedException) {
      return UnauthorizedFailure(e.message);
    } else if (e is NetworkException) {
      return NetworkFailure(e.message);
    } else if (e is TimeoutException) {
      return TimeoutFailure(e.message);
    } else if (e is ServerException) {
      return ServerFailure(e.message);
    } else if (e is ValidationException) {
      return ValidationFailure(e.message, errors: e.errors);
    } else {
      return UnknownFailure(e.toString());
    }
  }

  @override
  Future<Either<Failure, PageResponseMarket>> getMarkets({
    String? search,
    bool? pickupAvailable,
    bool? isAvailable,
    int page = 0,
    int size = 20,
  }) async {
    try {
      final model = await remoteDataSource.getMarkets(
        search: search,
        pickupAvailable: pickupAvailable,
        isAvailable: isAvailable,
        page: page,
        size: size,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, Market>> getMarketDetail(String id) async {
    try {
      final model = await remoteDataSource.getMarketDetails(id);
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<MarketCategory>>> getMarketCategories(
    String marketId,
  ) async {
    try {
      final models = await remoteDataSource.getMarketCategories(marketId);
      return Right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<MarketSubCategory>>> getMarketSubCategories({
    required String marketId,
    required String categoryId,
  }) async {
    try {
      final models = await remoteDataSource.getMarketSubCategories(
        marketId: marketId,
        categoryId: categoryId,
      );
      return Right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getMarketProducts({
    required String marketId,
    required String categoryId,
    required String subCategoryId,
  }) async {
    try {
      final models = await remoteDataSource.getMarketProducts(
        marketId: marketId,
        categoryId: categoryId,
        subCategoryId: subCategoryId,
      );
      return Right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<MarketOffer>>> getMarketOffers(
    String marketId,
  ) async {
    try {
      final models = await remoteDataSource.getMarketOffers(marketId);
      return Right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<Market>>> getFavoriteMarkets() async {
    try {
      final models = await remoteDataSource.getFavoriteMarkets();
      return Right(models.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> toggleFavoriteMarket(String marketId) async {
    try {
      final isFavorite = await remoteDataSource.toggleFavoriteMarket(marketId);
      return Right(isFavorite);
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }
}
