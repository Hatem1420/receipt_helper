import 'package:receipt_helper/features/sub/receipt_review/domain/entities/receipt_review_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'receipt_review_model.freezed.dart';
part 'receipt_review_model.g.dart';

@freezed
abstract class ReceiptReviewModel with _$ReceiptReviewModel {
  const factory ReceiptReviewModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _ReceiptReviewModel;

  factory ReceiptReviewModel.fromJson(Map<String, Object?> json) => _$ReceiptReviewModelFromJson(json);
}



extension ReceiptReviewModelMapper on ReceiptReviewModel {
  ReceiptReviewEntity toEntity() {
    return ReceiptReviewEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
