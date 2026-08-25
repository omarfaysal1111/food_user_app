import 'package:equatable/equatable.dart';
import '../../domain/entities/market.dart';
import '../../domain/entities/market_category.dart';
import '../../domain/entities/market_offer.dart';

abstract class MarketDetailsState extends Equatable {
  const MarketDetailsState();

  @override
  List<Object?> get props => [];
}

class MarketDetailsInitial extends MarketDetailsState {
  const MarketDetailsInitial();
}

class MarketDetailsLoading extends MarketDetailsState {
  const MarketDetailsLoading();
}

class MarketDetailsLoaded extends MarketDetailsState {
  final Market market;
  final List<MarketCategory> categories;
  final List<MarketOffer> offers;

  const MarketDetailsLoaded({
    required this.market,
    required this.categories,
    required this.offers,
  });

  MarketDetailsLoaded copyWith({
    Market? market,
    List<MarketCategory>? categories,
    List<MarketOffer>? offers,
  }) {
    return MarketDetailsLoaded(
      market: market ?? this.market,
      categories: categories ?? this.categories,
      offers: offers ?? this.offers,
    );
  }

  @override
  List<Object?> get props => [market, categories, offers];
}

class MarketDetailsNotFound extends MarketDetailsState {
  final String message;

  const MarketDetailsNotFound([this.message = 'Market no longer available']);

  @override
  List<Object?> get props => [message];
}

class MarketDetailsError extends MarketDetailsState {
  final String message;

  const MarketDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}
