// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sheets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSheetsModel _$UserSheetsModelFromJson(Map<String, dynamic> json) =>
    _UserSheetsModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$UserSheetsModelToJson(_UserSheetsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
