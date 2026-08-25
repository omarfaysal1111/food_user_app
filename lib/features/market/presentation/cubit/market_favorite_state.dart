import 'package:equatable/equatable.dart';
import '../../domain/entities/market.dart';

abstract class MarketFavoriteState extends Equatable {
  const MarketFavoriteState();

  @override
  List<Object?> get props => [];
}

class MarketFavoriteInitial extends MarketFavoriteState {
  const MarketFavoriteInitial();
}

class MarketFavoriteLoading extends MarketFavoriteState {
  const MarketFavoriteLoading();
}

class MarketFavoriteLoaded extends MarketFavoriteState {
  final List<Market> favoriteMarkets;

  /// Map tracking marketId -> isFavorite boolean for quick optimistic lookup
  final Map<String, bool> favoriteMap;

  const MarketFavoriteLoaded({
    required this.favoriteMarkets,
    required this.favoriteMap,
  });

  MarketFavoriteLoaded copyWith({
    List<Market>? favoriteMarkets,
    Map<String, bool>? favoriteMap,
  }) {
    return MarketFavoriteLoaded(
      favoriteMarkets: favoriteMarkets ?? this.favoriteMarkets,
      favoriteMap: favoriteMap ?? this.favoriteMap,
    );
  }

  @override
  List<Object?> get props => [favoriteMarkets, favoriteMap];
}

class MarketFavoriteError extends MarketFavoriteState {
  final String message;

  const MarketFavoriteError(this.message);

  @override
  List<Object?> get props => [message];
}

class MarketFavoriteAuthRequired extends MarketFavoriteState {
  const MarketFavoriteAuthRequired();
}
