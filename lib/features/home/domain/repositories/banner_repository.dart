import 'package:dartz/dartz.dart';
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/features/home/domain/entities/banner.dart';

abstract class BannerRepository {
  Future<Either<Failure, List<BannerItem>>> getActiveBanners();
}
