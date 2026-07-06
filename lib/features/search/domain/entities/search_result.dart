import 'package:equatable/equatable.dart';
import 'package:food_user_app/features/restaurant/domain/entities/restaurant.dart';
import 'package:food_user_app/features/restaurant/domain/entities/menu_item.dart';

class SearchResult extends Equatable {
  final List<Restaurant> restaurants;
  final List<MenuItem> items;

  const SearchResult({
    required this.restaurants,
    required this.items,
  });

  @override
  List<Object?> get props => [restaurants, items];
}
