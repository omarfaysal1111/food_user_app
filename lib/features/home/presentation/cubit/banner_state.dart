import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/home/domain/entities/banner.dart';

part 'banner_state.freezed.dart';

@freezed
abstract class BannerState with _$BannerState {
  const factory BannerState.initial() = _Initial;
  const factory BannerState.loading() = _Loading;
  const factory BannerState.loaded(List<BannerItem> banners) = _Loaded;
  const factory BannerState.error(String message) = _Error;
}
