// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReceiptReviewModel _$ReceiptReviewModelFromJson(Map<String, dynamic> json) =>
    _ReceiptReviewModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$ReceiptReviewModelToJson(_ReceiptReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
