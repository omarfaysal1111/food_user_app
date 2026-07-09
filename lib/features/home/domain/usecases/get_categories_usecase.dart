import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/category.dart';
import 'package:food_user_app/features/service_listing/presentation/models/service_listing_type.dart';
import 'package:food_user_app/core/constants/app_assets.dart';

class GetCategoriesUseCase extends UseCase<List<Category>, NoParams> {
  // If there's an API later, inject the repository here

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    // Return the default app categories as there's no API endpoint for these home categories yet
    return const Right([
      Category(
        id: '1',
        name: 'Restaurants', // We can use localization in the UI
        imageUrl: AppAssets.homeCategoryRestaurants,
        type: ServiceListingType.restaurants,
      ),
      Category(
        id: '2',
        name: 'Grocery',
        imageUrl: AppAssets.homeCategoryGrocery,
        type: ServiceListingType.grocery,
      ),
      Category(
        id: '3',
        name: 'Stores',
        imageUrl: AppAssets.homeCategoryStore,
        type: ServiceListingType.stores,
      ),
      Category(
        id: '4',
        name: 'Pickup',
        imageUrl: AppAssets.homeCategoryPickup,
        type: ServiceListingType.pickup,
      ),
    ]);
  }
}
