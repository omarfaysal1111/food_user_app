// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_modifier_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ItemModifierDto {

 String get id; String? get name; List<Map<String, dynamic>> get options;
/// Create a copy of ItemModifierDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemModifierDtoCopyWith<ItemModifierDto> get copyWith => _$ItemModifierDtoCopyWithImpl<ItemModifierDto>(this as ItemModifierDto, _$identity);

  /// Serializes this ItemModifierDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemModifierDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'ItemModifierDto(id: $id, name: $name, options: $options)';
}


}

/// @nodoc
abstract mixin class $ItemModifierDtoCopyWith<$Res>  {
  factory $ItemModifierDtoCopyWith(ItemModifierDto value, $Res Function(ItemModifierDto) _then) = _$ItemModifierDtoCopyWithImpl;
@useResult
$Res call({
 String id, String? name, List<Map<String, dynamic>> options
});




}
/// @nodoc
class _$ItemModifierDtoCopyWithImpl<$Res>
    implements $ItemModifierDtoCopyWith<$Res> {
  _$ItemModifierDtoCopyWithImpl(this._self, this._then);

  final ItemModifierDto _self;
  final $Res Function(ItemModifierDto) _then;

/// Create a copy of ItemModifierDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? options = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [ItemModifierDto].
extension ItemModifierDtoPatterns on ItemModifierDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemModifierDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemModifierDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemModifierDto value)  $default,){
final _that = this;
switch (_that) {
case _ItemModifierDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemModifierDto value)?  $default,){
final _that = this;
switch (_that) {
case _ItemModifierDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  List<Map<String, dynamic>> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemModifierDto() when $default != null:
return $default(_that.id,_that.name,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  List<Map<String, dynamic>> options)  $default,) {final _that = this;
switch (_that) {
case _ItemModifierDto():
return $default(_that.id,_that.name,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  List<Map<String, dynamic>> options)?  $default,) {final _that = this;
switch (_that) {
case _ItemModifierDto() when $default != null:
return $default(_that.id,_that.name,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ItemModifierDto implements ItemModifierDto {
  const _ItemModifierDto({required this.id, this.name, final  List<Map<String, dynamic>> options = const []}): _options = options;
  factory _ItemModifierDto.fromJson(Map<String, dynamic> json) => _$ItemModifierDtoFromJson(json);

@override final  String id;
@override final  String? name;
 final  List<Map<String, dynamic>> _options;
@override@JsonKey() List<Map<String, dynamic>> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of ItemModifierDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemModifierDtoCopyWith<_ItemModifierDto> get copyWith => __$ItemModifierDtoCopyWithImpl<_ItemModifierDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemModifierDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemModifierDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'ItemModifierDto(id: $id, name: $name, options: $options)';
}


}

/// @nodoc
abstract mixin class _$ItemModifierDtoCopyWith<$Res> implements $ItemModifierDtoCopyWith<$Res> {
  factory _$ItemModifierDtoCopyWith(_ItemModifierDto value, $Res Function(_ItemModifierDto) _then) = __$ItemModifierDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, List<Map<String, dynamic>> options
});




}
/// @nodoc
class __$ItemModifierDtoCopyWithImpl<$Res>
    implements _$ItemModifierDtoCopyWith<$Res> {
  __$ItemModifierDtoCopyWithImpl(this._self, this._then);

  final _ItemModifierDto _self;
  final $Res Function(_ItemModifierDto) _then;

/// Create a copy of ItemModifierDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? options = null,}) {
  return _then(_ItemModifierDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

// dart format on
