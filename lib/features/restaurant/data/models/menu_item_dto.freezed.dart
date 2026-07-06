// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuItemDto {

 String get id; String? get categoryId; String? get name; String? get description; double? get price; double? get originalPrice; String? get imageUrl; bool? get available;
/// Create a copy of MenuItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuItemDtoCopyWith<MenuItemDto> get copyWith => _$MenuItemDtoCopyWithImpl<MenuItemDto>(this as MenuItemDto, _$identity);

  /// Serializes this MenuItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.available, available) || other.available == available));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,name,description,price,originalPrice,imageUrl,available);

@override
String toString() {
  return 'MenuItemDto(id: $id, categoryId: $categoryId, name: $name, description: $description, price: $price, originalPrice: $originalPrice, imageUrl: $imageUrl, available: $available)';
}


}

/// @nodoc
abstract mixin class $MenuItemDtoCopyWith<$Res>  {
  factory $MenuItemDtoCopyWith(MenuItemDto value, $Res Function(MenuItemDto) _then) = _$MenuItemDtoCopyWithImpl;
@useResult
$Res call({
 String id, String? categoryId, String? name, String? description, double? price, double? originalPrice, String? imageUrl, bool? available
});




}
/// @nodoc
class _$MenuItemDtoCopyWithImpl<$Res>
    implements $MenuItemDtoCopyWith<$Res> {
  _$MenuItemDtoCopyWithImpl(this._self, this._then);

  final MenuItemDto _self;
  final $Res Function(MenuItemDto) _then;

/// Create a copy of MenuItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? categoryId = freezed,Object? name = freezed,Object? description = freezed,Object? price = freezed,Object? originalPrice = freezed,Object? imageUrl = freezed,Object? available = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as double?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,available: freezed == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuItemDto].
extension MenuItemDtoPatterns on MenuItemDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuItemDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuItemDto value)  $default,){
final _that = this;
switch (_that) {
case _MenuItemDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _MenuItemDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? categoryId,  String? name,  String? description,  double? price,  double? originalPrice,  String? imageUrl,  bool? available)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuItemDto() when $default != null:
return $default(_that.id,_that.categoryId,_that.name,_that.description,_that.price,_that.originalPrice,_that.imageUrl,_that.available);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? categoryId,  String? name,  String? description,  double? price,  double? originalPrice,  String? imageUrl,  bool? available)  $default,) {final _that = this;
switch (_that) {
case _MenuItemDto():
return $default(_that.id,_that.categoryId,_that.name,_that.description,_that.price,_that.originalPrice,_that.imageUrl,_that.available);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? categoryId,  String? name,  String? description,  double? price,  double? originalPrice,  String? imageUrl,  bool? available)?  $default,) {final _that = this;
switch (_that) {
case _MenuItemDto() when $default != null:
return $default(_that.id,_that.categoryId,_that.name,_that.description,_that.price,_that.originalPrice,_that.imageUrl,_that.available);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuItemDto implements MenuItemDto {
  const _MenuItemDto({required this.id, this.categoryId, this.name, this.description, this.price, this.originalPrice, this.imageUrl, this.available});
  factory _MenuItemDto.fromJson(Map<String, dynamic> json) => _$MenuItemDtoFromJson(json);

@override final  String id;
@override final  String? categoryId;
@override final  String? name;
@override final  String? description;
@override final  double? price;
@override final  double? originalPrice;
@override final  String? imageUrl;
@override final  bool? available;

/// Create a copy of MenuItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuItemDtoCopyWith<_MenuItemDto> get copyWith => __$MenuItemDtoCopyWithImpl<_MenuItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.available, available) || other.available == available));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,name,description,price,originalPrice,imageUrl,available);

@override
String toString() {
  return 'MenuItemDto(id: $id, categoryId: $categoryId, name: $name, description: $description, price: $price, originalPrice: $originalPrice, imageUrl: $imageUrl, available: $available)';
}


}

/// @nodoc
abstract mixin class _$MenuItemDtoCopyWith<$Res> implements $MenuItemDtoCopyWith<$Res> {
  factory _$MenuItemDtoCopyWith(_MenuItemDto value, $Res Function(_MenuItemDto) _then) = __$MenuItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String? categoryId, String? name, String? description, double? price, double? originalPrice, String? imageUrl, bool? available
});




}
/// @nodoc
class __$MenuItemDtoCopyWithImpl<$Res>
    implements _$MenuItemDtoCopyWith<$Res> {
  __$MenuItemDtoCopyWithImpl(this._self, this._then);

  final _MenuItemDto _self;
  final $Res Function(_MenuItemDto) _then;

/// Create a copy of MenuItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = freezed,Object? name = freezed,Object? description = freezed,Object? price = freezed,Object? originalPrice = freezed,Object? imageUrl = freezed,Object? available = freezed,}) {
  return _then(_MenuItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as double?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,available: freezed == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
