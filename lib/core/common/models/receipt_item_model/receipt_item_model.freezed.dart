// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReceiptItemModel {

 String? get name; double? get quantity; double? get unitPrice; double? get totalPrice;
/// Create a copy of ReceiptItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiptItemModelCopyWith<ReceiptItemModel> get copyWith => _$ReceiptItemModelCopyWithImpl<ReceiptItemModel>(this as ReceiptItemModel, _$identity);

  /// Serializes this ReceiptItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiptItemModel&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,quantity,unitPrice,totalPrice);

@override
String toString() {
  return 'ReceiptItemModel(name: $name, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice)';
}


}

/// @nodoc
abstract mixin class $ReceiptItemModelCopyWith<$Res>  {
  factory $ReceiptItemModelCopyWith(ReceiptItemModel value, $Res Function(ReceiptItemModel) _then) = _$ReceiptItemModelCopyWithImpl;
@useResult
$Res call({
 String? name, double? quantity, double? unitPrice, double? totalPrice
});




}
/// @nodoc
class _$ReceiptItemModelCopyWithImpl<$Res>
    implements $ReceiptItemModelCopyWith<$Res> {
  _$ReceiptItemModelCopyWithImpl(this._self, this._then);

  final ReceiptItemModel _self;
  final $Res Function(ReceiptItemModel) _then;

/// Create a copy of ReceiptItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? quantity = freezed,Object? unitPrice = freezed,Object? totalPrice = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,totalPrice: freezed == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReceiptItemModel].
extension ReceiptItemModelPatterns on ReceiptItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReceiptItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReceiptItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReceiptItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ReceiptItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReceiptItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReceiptItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  double? quantity,  double? unitPrice,  double? totalPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReceiptItemModel() when $default != null:
return $default(_that.name,_that.quantity,_that.unitPrice,_that.totalPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  double? quantity,  double? unitPrice,  double? totalPrice)  $default,) {final _that = this;
switch (_that) {
case _ReceiptItemModel():
return $default(_that.name,_that.quantity,_that.unitPrice,_that.totalPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  double? quantity,  double? unitPrice,  double? totalPrice)?  $default,) {final _that = this;
switch (_that) {
case _ReceiptItemModel() when $default != null:
return $default(_that.name,_that.quantity,_that.unitPrice,_that.totalPrice);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _ReceiptItemModel implements ReceiptItemModel {
  const _ReceiptItemModel({this.name, this.quantity, this.unitPrice, this.totalPrice});
  factory _ReceiptItemModel.fromJson(Map<String, dynamic> json) => _$ReceiptItemModelFromJson(json);

@override final  String? name;
@override final  double? quantity;
@override final  double? unitPrice;
@override final  double? totalPrice;

/// Create a copy of ReceiptItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceiptItemModelCopyWith<_ReceiptItemModel> get copyWith => __$ReceiptItemModelCopyWithImpl<_ReceiptItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReceiptItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReceiptItemModel&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,quantity,unitPrice,totalPrice);

@override
String toString() {
  return 'ReceiptItemModel(name: $name, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice)';
}


}

/// @nodoc
abstract mixin class _$ReceiptItemModelCopyWith<$Res> implements $ReceiptItemModelCopyWith<$Res> {
  factory _$ReceiptItemModelCopyWith(_ReceiptItemModel value, $Res Function(_ReceiptItemModel) _then) = __$ReceiptItemModelCopyWithImpl;
@override @useResult
$Res call({
 String? name, double? quantity, double? unitPrice, double? totalPrice
});




}
/// @nodoc
class __$ReceiptItemModelCopyWithImpl<$Res>
    implements _$ReceiptItemModelCopyWith<$Res> {
  __$ReceiptItemModelCopyWithImpl(this._self, this._then);

  final _ReceiptItemModel _self;
  final $Res Function(_ReceiptItemModel) _then;

/// Create a copy of ReceiptItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? quantity = freezed,Object? unitPrice = freezed,Object? totalPrice = freezed,}) {
  return _then(_ReceiptItemModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,totalPrice: freezed == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
