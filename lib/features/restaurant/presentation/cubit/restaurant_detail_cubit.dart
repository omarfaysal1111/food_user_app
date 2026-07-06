import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_user_app/features/restaurant/domain/entities/branch.dart';
import 'package:food_user_app/features/restaurant/domain/entities/offer.dart';
import 'package:food_user_app/features/restaurant/domain/repositories/restaurant_repository.dart';
import 'restaurant_detail_state.dart';

class RestaurantDetailCubit extends Cubit<RestaurantDetailState> {
  final RestaurantRepository restaurantRepository;

  RestaurantDetailCubit({required this.restaurantRepository})
      : super(const RestaurantDetailState.initial());

  Future<void> getRestaurantDetail(String id) async {
    emit(const RestaurantDetailState.loading());
    final detailResult = await restaurantRepository.getRestaurantDetail(id);

    detailResult.fold(
      (failure) => emit(RestaurantDetailState.error(failure.message)),
      (restaurant) async {
        final branchesResult =
            await restaurantRepository.getBranches(restaurant.id);
        final offersResult =
            await restaurantRepository.getOffers(restaurant.id);

        final branches = branchesResult.fold((_) => <Branch>[], (list) => list);
        final offers = offersResult.fold((_) => <Offer>[], (list) => list);

        emit(RestaurantDetailState.loaded(
          restaurant: restaurant,
          branches: branches,
          offers: offers,
        ));
      },
    );
  }
}
