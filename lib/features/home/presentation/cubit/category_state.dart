import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/home/domain/entities/category.dart';

part 'category_state.freezed.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;
  const factory CategoryState.loading() = _Loading;
  const factory CategoryState.loaded(List<Category> categories) = _Loaded;
  const factory CategoryState.error(String message) = _Error;
}
