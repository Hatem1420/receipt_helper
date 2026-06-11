import 'package:receipt_helper/features/sub/user_sheets/domain/entities/user_sheets_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_sheets_model.freezed.dart';
part 'user_sheets_model.g.dart';

@freezed
abstract class UserSheetsModel with _$UserSheetsModel {
  const factory UserSheetsModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _UserSheetsModel;

  factory UserSheetsModel.fromJson(Map<String, Object?> json) => _$UserSheetsModelFromJson(json);
}



extension UserSheetsModelMapper on UserSheetsModel {
  UserSheetsEntity toEntity() {
    return UserSheetsEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
