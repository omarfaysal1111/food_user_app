import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/market.dart';
import '../entities/market_category.dart';
import '../entities/market_offer.dart';
import '../entities/market_sub_category.dart';
import '../entities/page_response_market.dart';
import '../entities/product.dart';

abstract class MarketRepository {
  Future<Either<Failure, PageResponseMarket>> getMarkets({
    String? search,
    bool? pickupAvailable,
    bool? isAvailable,
    int page = 0,
    int size = 20,
  });

  Future<Either<Failure, Market>> getMarketDetail(String id);

  Future<Either<Failure, List<MarketCategory>>> getMarketCategories(
    String marketId,
  );

  Future<Either<Failure, List<MarketSubCategory>>> getMarketSubCategories({
    required String marketId,
    required String categoryId,
  });

  Future<Either<Failure, List<Product>>> getMarketProducts({
    required String marketId,
    required String categoryId,
    required String subCategoryId,
  });

  Future<Either<Failure, List<MarketOffer>>> getMarketOffers(String marketId);

  Future<Either<Failure, List<Market>>> getFavoriteMarkets();

  /// Toggles favorite state. Returns the updated boolean `isFavorite`.
  Future<Either<Failure, bool>> toggleFavoriteMarket(String marketId);
}
