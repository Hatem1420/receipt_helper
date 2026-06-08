// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MerchantModel {

 String? get name; String? get branch; String? get taxNumber; String? get phone; String? get address;
/// Create a copy of MerchantModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MerchantModelCopyWith<MerchantModel> get copyWith => _$MerchantModelCopyWithImpl<MerchantModel>(this as MerchantModel, _$identity);

  /// Serializes this MerchantModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MerchantModel&&(identical(other.name, name) || other.name == name)&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.taxNumber, taxNumber) || other.taxNumber == taxNumber)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,branch,taxNumber,phone,address);

@override
String toString() {
  return 'MerchantModel(name: $name, branch: $branch, taxNumber: $taxNumber, phone: $phone, address: $address)';
}


}

/// @nodoc
abstract mixin class $MerchantModelCopyWith<$Res>  {
  factory $MerchantModelCopyWith(MerchantModel value, $Res Function(MerchantModel) _then) = _$MerchantModelCopyWithImpl;
@useResult
$Res call({
 String? name, String? branch, String? taxNumber, String? phone, String? address
});




}
/// @nodoc
class _$MerchantModelCopyWithImpl<$Res>
    implements $MerchantModelCopyWith<$Res> {
  _$MerchantModelCopyWithImpl(this._self, this._then);

  final MerchantModel _self;
  final $Res Function(MerchantModel) _then;

/// Create a copy of MerchantModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? branch = freezed,Object? taxNumber = freezed,Object? phone = freezed,Object? address = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,branch: freezed == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as String?,taxNumber: freezed == taxNumber ? _self.taxNumber : taxNumber // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MerchantModel].
extension MerchantModelPatterns on MerchantModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MerchantModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MerchantModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MerchantModel value)  $default,){
final _that = this;
switch (_that) {
case _MerchantModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MerchantModel value)?  $default,){
final _that = this;
switch (_that) {
case _MerchantModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? branch,  String? taxNumber,  String? phone,  String? address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MerchantModel() when $default != null:
return $default(_that.name,_that.branch,_that.taxNumber,_that.phone,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? branch,  String? taxNumber,  String? phone,  String? address)  $default,) {final _that = this;
switch (_that) {
case _MerchantModel():
return $default(_that.name,_that.branch,_that.taxNumber,_that.phone,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? branch,  String? taxNumber,  String? phone,  String? address)?  $default,) {final _that = this;
switch (_that) {
case _MerchantModel() when $default != null:
return $default(_that.name,_that.branch,_that.taxNumber,_that.phone,_that.address);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _MerchantModel implements MerchantModel {
  const _MerchantModel({this.name, this.branch, this.taxNumber, this.phone, this.address});
  factory _MerchantModel.fromJson(Map<String, dynamic> json) => _$MerchantModelFromJson(json);

@override final  String? name;
@override final  String? branch;
@override final  String? taxNumber;
@override final  String? phone;
@override final  String? address;

/// Create a copy of MerchantModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MerchantModelCopyWith<_MerchantModel> get copyWith => __$MerchantModelCopyWithImpl<_MerchantModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MerchantModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MerchantModel&&(identical(other.name, name) || other.name == name)&&(identical(other.branch, branch) || other.branch == branch)&&(identical(other.taxNumber, taxNumber) || other.taxNumber == taxNumber)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,branch,taxNumber,phone,address);

@override
String toString() {
  return 'MerchantModel(name: $name, branch: $branch, taxNumber: $taxNumber, phone: $phone, address: $address)';
}


}

/// @nodoc
abstract mixin class _$MerchantModelCopyWith<$Res> implements $MerchantModelCopyWith<$Res> {
  factory _$MerchantModelCopyWith(_MerchantModel value, $Res Function(_MerchantModel) _then) = __$MerchantModelCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? branch, String? taxNumber, String? phone, String? address
});




}
/// @nodoc
class __$MerchantModelCopyWithImpl<$Res>
    implements _$MerchantModelCopyWith<$Res> {
  __$MerchantModelCopyWithImpl(this._self, this._then);

  final _MerchantModel _self;
  final $Res Function(_MerchantModel) _then;

/// Create a copy of MerchantModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? branch = freezed,Object? taxNumber = freezed,Object? phone = freezed,Object? address = freezed,}) {
  return _then(_MerchantModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,branch: freezed == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as String?,taxNumber: freezed == taxNumber ? _self.taxNumber : taxNumber // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
