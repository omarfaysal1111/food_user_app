// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BannerDto {

 String get id; String? get imageUrl; String? get title; String? get subtitle; String? get ctaText; String? get discountText; String? get deepLink; int? get sortOrder; bool? get active;
/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerDtoCopyWith<BannerDto> get copyWith => _$BannerDtoCopyWithImpl<BannerDto>(this as BannerDto, _$identity);

  /// Serializes this BannerDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerDto&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.ctaText, ctaText) || other.ctaText == ctaText)&&(identical(other.discountText, discountText) || other.discountText == discountText)&&(identical(other.deepLink, deepLink) || other.deepLink == deepLink)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,title,subtitle,ctaText,discountText,deepLink,sortOrder,active);

@override
String toString() {
  return 'BannerDto(id: $id, imageUrl: $imageUrl, title: $title, subtitle: $subtitle, ctaText: $ctaText, discountText: $discountText, deepLink: $deepLink, sortOrder: $sortOrder, active: $active)';
}


}

/// @nodoc
abstract mixin class $BannerDtoCopyWith<$Res>  {
  factory $BannerDtoCopyWith(BannerDto value, $Res Function(BannerDto) _then) = _$BannerDtoCopyWithImpl;
@useResult
$Res call({
 String id, String? imageUrl, String? title, String? subtitle, String? ctaText, String? discountText, String? deepLink, int? sortOrder, bool? active
});




}
/// @nodoc
class _$BannerDtoCopyWithImpl<$Res>
    implements $BannerDtoCopyWith<$Res> {
  _$BannerDtoCopyWithImpl(this._self, this._then);

  final BannerDto _self;
  final $Res Function(BannerDto) _then;

/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? imageUrl = freezed,Object? title = freezed,Object? subtitle = freezed,Object? ctaText = freezed,Object? discountText = freezed,Object? deepLink = freezed,Object? sortOrder = freezed,Object? active = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,ctaText: freezed == ctaText ? _self.ctaText : ctaText // ignore: cast_nullable_to_non_nullable
as String?,discountText: freezed == discountText ? _self.discountText : discountText // ignore: cast_nullable_to_non_nullable
as String?,deepLink: freezed == deepLink ? _self.deepLink : deepLink // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerDto].
extension BannerDtoPatterns on BannerDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerDto value)  $default,){
final _that = this;
switch (_that) {
case _BannerDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerDto value)?  $default,){
final _that = this;
switch (_that) {
case _BannerDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? imageUrl,  String? title,  String? subtitle,  String? ctaText,  String? discountText,  String? deepLink,  int? sortOrder,  bool? active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerDto() when $default != null:
return $default(_that.id,_that.imageUrl,_that.title,_that.subtitle,_that.ctaText,_that.discountText,_that.deepLink,_that.sortOrder,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? imageUrl,  String? title,  String? subtitle,  String? ctaText,  String? discountText,  String? deepLink,  int? sortOrder,  bool? active)  $default,) {final _that = this;
switch (_that) {
case _BannerDto():
return $default(_that.id,_that.imageUrl,_that.title,_that.subtitle,_that.ctaText,_that.discountText,_that.deepLink,_that.sortOrder,_that.active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? imageUrl,  String? title,  String? subtitle,  String? ctaText,  String? discountText,  String? deepLink,  int? sortOrder,  bool? active)?  $default,) {final _that = this;
switch (_that) {
case _BannerDto() when $default != null:
return $default(_that.id,_that.imageUrl,_that.title,_that.subtitle,_that.ctaText,_that.discountText,_that.deepLink,_that.sortOrder,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BannerDto implements BannerDto {
  const _BannerDto({required this.id, this.imageUrl, this.title, this.subtitle, this.ctaText, this.discountText, this.deepLink, this.sortOrder, this.active});
  factory _BannerDto.fromJson(Map<String, dynamic> json) => _$BannerDtoFromJson(json);

@override final  String id;
@override final  String? imageUrl;
@override final  String? title;
@override final  String? subtitle;
@override final  String? ctaText;
@override final  String? discountText;
@override final  String? deepLink;
@override final  int? sortOrder;
@override final  bool? active;

/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerDtoCopyWith<_BannerDto> get copyWith => __$BannerDtoCopyWithImpl<_BannerDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BannerDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerDto&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.ctaText, ctaText) || other.ctaText == ctaText)&&(identical(other.discountText, discountText) || other.discountText == discountText)&&(identical(other.deepLink, deepLink) || other.deepLink == deepLink)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,title,subtitle,ctaText,discountText,deepLink,sortOrder,active);

@override
String toString() {
  return 'BannerDto(id: $id, imageUrl: $imageUrl, title: $title, subtitle: $subtitle, ctaText: $ctaText, discountText: $discountText, deepLink: $deepLink, sortOrder: $sortOrder, active: $active)';
}


}

/// @nodoc
abstract mixin class _$BannerDtoCopyWith<$Res> implements $BannerDtoCopyWith<$Res> {
  factory _$BannerDtoCopyWith(_BannerDto value, $Res Function(_BannerDto) _then) = __$BannerDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String? imageUrl, String? title, String? subtitle, String? ctaText, String? discountText, String? deepLink, int? sortOrder, bool? active
});




}
/// @nodoc
class __$BannerDtoCopyWithImpl<$Res>
    implements _$BannerDtoCopyWith<$Res> {
  __$BannerDtoCopyWithImpl(this._self, this._then);

  final _BannerDto _self;
  final $Res Function(_BannerDto) _then;

/// Create a copy of BannerDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? imageUrl = freezed,Object? title = freezed,Object? subtitle = freezed,Object? ctaText = freezed,Object? discountText = freezed,Object? deepLink = freezed,Object? sortOrder = freezed,Object? active = freezed,}) {
  return _then(_BannerDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,ctaText: freezed == ctaText ? _self.ctaText : ctaText // ignore: cast_nullable_to_non_nullable
as String?,discountText: freezed == discountText ? _self.discountText : discountText // ignore: cast_nullable_to_non_nullable
as String?,deepLink: freezed == deepLink ? _self.deepLink : deepLink // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
