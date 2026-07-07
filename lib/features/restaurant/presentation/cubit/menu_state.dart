import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/restaurant/domain/entities/menu_category.dart';
import 'package:food_user_app/features/restaurant/domain/entities/modifier.dart';

part 'menu_state.freezed.dart';

@freezed
class MenuState with _$MenuState {
  const factory MenuState.initial() = _Initial;
  const factory MenuState.loading() = _Loading;
  const factory MenuState.loaded({required List<MenuCategory> categories}) =
      _Loaded;
  const factory MenuState.modifiersLoaded({required List<Modifier> modifiers}) =
      _ModifiersLoaded;
  const factory MenuState.error(String message) = _Error;
}
