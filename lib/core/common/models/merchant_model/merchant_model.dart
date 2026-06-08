import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:receipt_helper/core/common/entities/merchant_entity.dart';

part 'merchant_model.freezed.dart';
part 'merchant_model.g.dart';

@freezed
abstract class MerchantModel with _$MerchantModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: .snake)
  const factory MerchantModel({
    String? name,
    String? branch,
    String? taxNumber,
    String? phone,
    String? address,
  }) = _MerchantModel;

  factory MerchantModel.fromJson(Map<String, dynamic> json) =>
      _$MerchantModelFromJson(json);

  factory MerchantModel.fromEntity(MerchantEntity? entity) {
    return MerchantModel(
      name: entity?.name,
      branch: entity?.branch,
      taxNumber: entity?.taxNumber,
      phone: entity?.phone,
      address: entity?.address,
    );
  }
}

extension MerchantModelMapper on MerchantModel {
  MerchantEntity toEntity() => MerchantEntity(
    name: name,
    branch: branch,
    taxNumber: taxNumber,
    phone: phone,
    address: address,
  );
}
