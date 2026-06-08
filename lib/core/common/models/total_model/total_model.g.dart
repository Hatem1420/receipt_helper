// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TotalModel _$TotalModelFromJson(Map<String, dynamic> json) => _TotalModel(
  subTotalModel: (json['subtotal'] as num?)?.toDouble(),
  discount: (json['discount'] as num?)?.toDouble(),
  tax: (json['tax'] as num?)?.toDouble(),
  serviceCharge: (json['service_charge'] as num?)?.toDouble(),
  total: (json['total'] as num?)?.toDouble(),
);

Map<String, dynamic> _$TotalModelToJson(_TotalModel instance) =>
    <String, dynamic>{
      'subtotal': instance.subTotalModel,
      'discount': instance.discount,
      'tax': instance.tax,
      'service_charge': instance.serviceCharge,
      'total': instance.total,
    };
