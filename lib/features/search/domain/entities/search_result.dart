import 'package:equatable/equatable.dart';
import 'package:food_user_app/features/restaurant/domain/entities/restaurant.dart';
import 'package:food_user_app/features/restaurant/domain/entities/menu_item.dart';

class SearchResult extends Equatable {
  final List<Restaurant> restaurants;
  final List<MenuItem> items;
  final bool isRandom;

  const SearchResult({
    required this.restaurants,
    required this.items,
    this.isRandom = false,
  });

  @override
  List<Object?> get props => [restaurants, items, isRandom];
}
