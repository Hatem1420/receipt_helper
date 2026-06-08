// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MerchantModel _$MerchantModelFromJson(Map<String, dynamic> json) =>
    _MerchantModel(
      name: json['name'] as String?,
      branch: json['branch'] as String?,
      taxNumber: json['tax_number'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$MerchantModelToJson(_MerchantModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'branch': instance.branch,
      'tax_number': instance.taxNumber,
      'phone': instance.phone,
      'address': instance.address,
    };
