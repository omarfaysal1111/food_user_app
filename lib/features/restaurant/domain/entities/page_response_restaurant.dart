import 'package:equatable/equatable.dart';
import 'package:food_user_app/features/restaurant/domain/entities/restaurant.dart';

class PageResponseRestaurant extends Equatable {
  final List<Restaurant> content;
  final int page;
  final int size;
  final int totalElements;
  final int totalPages;
  final bool last;

  const PageResponseRestaurant({
    required this.content,
    required this.page,
    required this.size,
    required this.totalElements,
    required this.totalPages,
    required this.last,
  });

  @override
  List<Object?> get props => [
    content,
    page,
    size,
    totalElements,
    totalPages,
    last,
  ];
}
