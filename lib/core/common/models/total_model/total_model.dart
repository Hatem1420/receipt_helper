import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:receipt_helper/core/common/entities/total_entity.dart';

part 'total_model.freezed.dart';
part 'total_model.g.dart';

@freezed
abstract class TotalModel with _$TotalModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: .snake)
  const factory TotalModel({
    @JsonKey(name: 'subtotal')
    double? subTotalModel,
    double? discount,
    double? tax,
    double? serviceCharge,
    double? total,
  }) = _TotalModel;

  factory TotalModel.fromJson(Map<String, dynamic> json) =>
      _$TotalModelFromJson(json);

  factory TotalModel.fromEntity(TotalEntity? entity) {
    return TotalModel(
      subTotalModel: entity?.subTotalModel,
      discount: entity?.discount,
      tax: entity?.tax,
      serviceCharge: entity?.serviceCharge,
      total: entity?.total,
    );
  }
}

extension TotalModelMapper on TotalModel {
  TotalEntity toEntity() => TotalEntity(
    subTotalModel: subTotalModel,
    discount: discount,
    tax: tax,
    serviceCharge: serviceCharge,
    total: total,
  );
}
