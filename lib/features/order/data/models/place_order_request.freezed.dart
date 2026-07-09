// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaceOrderRequest {

 String get branchId; List<OrderItemRequest> get items; String? get addressId; String? get deliveryAddress; double? get deliveryLat; double? get deliveryLng; String? get paymentMethod; String? get promoCode; String? get specialInstructions;
/// Create a copy of PlaceOrderRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceOrderRequestCopyWith<PlaceOrderRequest> get copyWith => _$PlaceOrderRequestCopyWithImpl<PlaceOrderRequest>(this as PlaceOrderRequest, _$identity);

  /// Serializes this PlaceOrderRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceOrderRequest&&(identical(other.branchId, branchId) || other.branchId == branchId)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.deliveryAddress, deliveryAddress) || other.deliveryAddress == deliveryAddress)&&(identical(other.deliveryLat, deliveryLat) || other.deliveryLat == deliveryLat)&&(identical(other.deliveryLng, deliveryLng) || other.deliveryLng == deliveryLng)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.promoCode, promoCode) || other.promoCode == promoCode)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,branchId,const DeepCollectionEquality().hash(items),addressId,deliveryAddress,deliveryLat,deliveryLng,paymentMethod,promoCode,specialInstructions);

@override
String toString() {
  return 'PlaceOrderRequest(branchId: $branchId, items: $items, addressId: $addressId, deliveryAddress: $deliveryAddress, deliveryLat: $deliveryLat, deliveryLng: $deliveryLng, paymentMethod: $paymentMethod, promoCode: $promoCode, specialInstructions: $specialInstructions)';
}


}

/// @nodoc
abstract mixin class $PlaceOrderRequestCopyWith<$Res>  {
  factory $PlaceOrderRequestCopyWith(PlaceOrderRequest value, $Res Function(PlaceOrderRequest) _then) = _$PlaceOrderRequestCopyWithImpl;
@useResult
$Res call({
 String branchId, List<OrderItemRequest> items, String? addressId, String? deliveryAddress, double? deliveryLat, double? deliveryLng, String? paymentMethod, String? promoCode, String? specialInstructions
});




}
/// @nodoc
class _$PlaceOrderRequestCopyWithImpl<$Res>
    implements $PlaceOrderRequestCopyWith<$Res> {
  _$PlaceOrderRequestCopyWithImpl(this._self, this._then);

  final PlaceOrderRequest _self;
  final $Res Function(PlaceOrderRequest) _then;

/// Create a copy of PlaceOrderRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? branchId = null,Object? items = null,Object? addressId = freezed,Object? deliveryAddress = freezed,Object? deliveryLat = freezed,Object? deliveryLng = freezed,Object? paymentMethod = freezed,Object? promoCode = freezed,Object? specialInstructions = freezed,}) {
  return _then(_self.copyWith(
branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemRequest>,addressId: freezed == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as String?,deliveryAddress: freezed == deliveryAddress ? _self.deliveryAddress : deliveryAddress // ignore: cast_nullable_to_non_nullable
as String?,deliveryLat: freezed == deliveryLat ? _self.deliveryLat : deliveryLat // ignore: cast_nullable_to_non_nullable
as double?,deliveryLng: freezed == deliveryLng ? _self.deliveryLng : deliveryLng // ignore: cast_nullable_to_non_nullable
as double?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,promoCode: freezed == promoCode ? _self.promoCode : promoCode // ignore: cast_nullable_to_non_nullable
as String?,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaceOrderRequest].
extension PlaceOrderRequestPatterns on PlaceOrderRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaceOrderRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaceOrderRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaceOrderRequest value)  $default,){
final _that = this;
switch (_that) {
case _PlaceOrderRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaceOrderRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PlaceOrderRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String branchId,  List<OrderItemRequest> items,  String? addressId,  String? deliveryAddress,  double? deliveryLat,  double? deliveryLng,  String? paymentMethod,  String? promoCode,  String? specialInstructions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaceOrderRequest() when $default != null:
return $default(_that.branchId,_that.items,_that.addressId,_that.deliveryAddress,_that.deliveryLat,_that.deliveryLng,_that.paymentMethod,_that.promoCode,_that.specialInstructions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String branchId,  List<OrderItemRequest> items,  String? addressId,  String? deliveryAddress,  double? deliveryLat,  double? deliveryLng,  String? paymentMethod,  String? promoCode,  String? specialInstructions)  $default,) {final _that = this;
switch (_that) {
case _PlaceOrderRequest():
return $default(_that.branchId,_that.items,_that.addressId,_that.deliveryAddress,_that.deliveryLat,_that.deliveryLng,_that.paymentMethod,_that.promoCode,_that.specialInstructions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String branchId,  List<OrderItemRequest> items,  String? addressId,  String? deliveryAddress,  double? deliveryLat,  double? deliveryLng,  String? paymentMethod,  String? promoCode,  String? specialInstructions)?  $default,) {final _that = this;
switch (_that) {
case _PlaceOrderRequest() when $default != null:
return $default(_that.branchId,_that.items,_that.addressId,_that.deliveryAddress,_that.deliveryLat,_that.deliveryLng,_that.paymentMethod,_that.promoCode,_that.specialInstructions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaceOrderRequest implements PlaceOrderRequest {
  const _PlaceOrderRequest({required this.branchId, required final  List<OrderItemRequest> items, this.addressId, this.deliveryAddress, this.deliveryLat, this.deliveryLng, this.paymentMethod, this.promoCode, this.specialInstructions}): _items = items;
  factory _PlaceOrderRequest.fromJson(Map<String, dynamic> json) => _$PlaceOrderRequestFromJson(json);

@override final  String branchId;
 final  List<OrderItemRequest> _items;
@override List<OrderItemRequest> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? addressId;
@override final  String? deliveryAddress;
@override final  double? deliveryLat;
@override final  double? deliveryLng;
@override final  String? paymentMethod;
@override final  String? promoCode;
@override final  String? specialInstructions;

/// Create a copy of PlaceOrderRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceOrderRequestCopyWith<_PlaceOrderRequest> get copyWith => __$PlaceOrderRequestCopyWithImpl<_PlaceOrderRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaceOrderRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceOrderRequest&&(identical(other.branchId, branchId) || other.branchId == branchId)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.deliveryAddress, deliveryAddress) || other.deliveryAddress == deliveryAddress)&&(identical(other.deliveryLat, deliveryLat) || other.deliveryLat == deliveryLat)&&(identical(other.deliveryLng, deliveryLng) || other.deliveryLng == deliveryLng)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.promoCode, promoCode) || other.promoCode == promoCode)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,branchId,const DeepCollectionEquality().hash(_items),addressId,deliveryAddress,deliveryLat,deliveryLng,paymentMethod,promoCode,specialInstructions);

@override
String toString() {
  return 'PlaceOrderRequest(branchId: $branchId, items: $items, addressId: $addressId, deliveryAddress: $deliveryAddress, deliveryLat: $deliveryLat, deliveryLng: $deliveryLng, paymentMethod: $paymentMethod, promoCode: $promoCode, specialInstructions: $specialInstructions)';
}


}

/// @nodoc
abstract mixin class _$PlaceOrderRequestCopyWith<$Res> implements $PlaceOrderRequestCopyWith<$Res> {
  factory _$PlaceOrderRequestCopyWith(_PlaceOrderRequest value, $Res Function(_PlaceOrderRequest) _then) = __$PlaceOrderRequestCopyWithImpl;
@override @useResult
$Res call({
 String branchId, List<OrderItemRequest> items, String? addressId, String? deliveryAddress, double? deliveryLat, double? deliveryLng, String? paymentMethod, String? promoCode, String? specialInstructions
});




}
/// @nodoc
class __$PlaceOrderRequestCopyWithImpl<$Res>
    implements _$PlaceOrderRequestCopyWith<$Res> {
  __$PlaceOrderRequestCopyWithImpl(this._self, this._then);

  final _PlaceOrderRequest _self;
  final $Res Function(_PlaceOrderRequest) _then;

/// Create a copy of PlaceOrderRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? branchId = null,Object? items = null,Object? addressId = freezed,Object? deliveryAddress = freezed,Object? deliveryLat = freezed,Object? deliveryLng = freezed,Object? paymentMethod = freezed,Object? promoCode = freezed,Object? specialInstructions = freezed,}) {
  return _then(_PlaceOrderRequest(
branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemRequest>,addressId: freezed == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as String?,deliveryAddress: freezed == deliveryAddress ? _self.deliveryAddress : deliveryAddress // ignore: cast_nullable_to_non_nullable
as String?,deliveryLat: freezed == deliveryLat ? _self.deliveryLat : deliveryLat // ignore: cast_nullable_to_non_nullable
as double?,deliveryLng: freezed == deliveryLng ? _self.deliveryLng : deliveryLng // ignore: cast_nullable_to_non_nullable
as double?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,promoCode: freezed == promoCode ? _self.promoCode : promoCode // ignore: cast_nullable_to_non_nullable
as String?,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OrderItemRequest {

 String get menuItemId; int get quantity; List<dynamic>? get selectedModifiers; String? get notes;
/// Create a copy of OrderItemRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemRequestCopyWith<OrderItemRequest> get copyWith => _$OrderItemRequestCopyWithImpl<OrderItemRequest>(this as OrderItemRequest, _$identity);

  /// Serializes this OrderItemRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItemRequest&&(identical(other.menuItemId, menuItemId) || other.menuItemId == menuItemId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other.selectedModifiers, selectedModifiers)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuItemId,quantity,const DeepCollectionEquality().hash(selectedModifiers),notes);

@override
String toString() {
  return 'OrderItemRequest(menuItemId: $menuItemId, quantity: $quantity, selectedModifiers: $selectedModifiers, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $OrderItemRequestCopyWith<$Res>  {
  factory $OrderItemRequestCopyWith(OrderItemRequest value, $Res Function(OrderItemRequest) _then) = _$OrderItemRequestCopyWithImpl;
@useResult
$Res call({
 String menuItemId, int quantity, List<dynamic>? selectedModifiers, String? notes
});




}
/// @nodoc
class _$OrderItemRequestCopyWithImpl<$Res>
    implements $OrderItemRequestCopyWith<$Res> {
  _$OrderItemRequestCopyWithImpl(this._self, this._then);

  final OrderItemRequest _self;
  final $Res Function(OrderItemRequest) _then;

/// Create a copy of OrderItemRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menuItemId = null,Object? quantity = null,Object? selectedModifiers = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,selectedModifiers: freezed == selectedModifiers ? _self.selectedModifiers : selectedModifiers // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderItemRequest].
extension OrderItemRequestPatterns on OrderItemRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItemRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItemRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItemRequest value)  $default,){
final _that = this;
switch (_that) {
case _OrderItemRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItemRequest value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItemRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String menuItemId,  int quantity,  List<dynamic>? selectedModifiers,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItemRequest() when $default != null:
return $default(_that.menuItemId,_that.quantity,_that.selectedModifiers,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String menuItemId,  int quantity,  List<dynamic>? selectedModifiers,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _OrderItemRequest():
return $default(_that.menuItemId,_that.quantity,_that.selectedModifiers,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String menuItemId,  int quantity,  List<dynamic>? selectedModifiers,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _OrderItemRequest() when $default != null:
return $default(_that.menuItemId,_that.quantity,_that.selectedModifiers,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItemRequest implements OrderItemRequest {
  const _OrderItemRequest({required this.menuItemId, required this.quantity, final  List<dynamic>? selectedModifiers, this.notes}): _selectedModifiers = selectedModifiers;
  factory _OrderItemRequest.fromJson(Map<String, dynamic> json) => _$OrderItemRequestFromJson(json);

@override final  String menuItemId;
@override final  int quantity;
 final  List<dynamic>? _selectedModifiers;
@override List<dynamic>? get selectedModifiers {
  final value = _selectedModifiers;
  if (value == null) return null;
  if (_selectedModifiers is EqualUnmodifiableListView) return _selectedModifiers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? notes;

/// Create a copy of OrderItemRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemRequestCopyWith<_OrderItemRequest> get copyWith => __$OrderItemRequestCopyWithImpl<_OrderItemRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItemRequest&&(identical(other.menuItemId, menuItemId) || other.menuItemId == menuItemId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other._selectedModifiers, _selectedModifiers)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuItemId,quantity,const DeepCollectionEquality().hash(_selectedModifiers),notes);

@override
String toString() {
  return 'OrderItemRequest(menuItemId: $menuItemId, quantity: $quantity, selectedModifiers: $selectedModifiers, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$OrderItemRequestCopyWith<$Res> implements $OrderItemRequestCopyWith<$Res> {
  factory _$OrderItemRequestCopyWith(_OrderItemRequest value, $Res Function(_OrderItemRequest) _then) = __$OrderItemRequestCopyWithImpl;
@override @useResult
$Res call({
 String menuItemId, int quantity, List<dynamic>? selectedModifiers, String? notes
});




}
/// @nodoc
class __$OrderItemRequestCopyWithImpl<$Res>
    implements _$OrderItemRequestCopyWith<$Res> {
  __$OrderItemRequestCopyWithImpl(this._self, this._then);

  final _OrderItemRequest _self;
  final $Res Function(_OrderItemRequest) _then;

/// Create a copy of OrderItemRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menuItemId = null,Object? quantity = null,Object? selectedModifiers = freezed,Object? notes = freezed,}) {
  return _then(_OrderItemRequest(
menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,selectedModifiers: freezed == selectedModifiers ? _self._selectedModifiers : selectedModifiers // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
