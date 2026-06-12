import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:receipt_helper/core/common/entities/receipt_entity.dart';
import 'package:receipt_helper/core/errors/failure.dart';
import 'package:receipt_helper/features/sub/receipt_review/domain/repositories/receipt_review_repository_domain.dart';

@lazySingleton
class ReceiptReviewUseCase {
  final ReceiptReviewRepositoryDomain _repositoryData;

  ReceiptReviewUseCase(this._repositoryData);

  Future<Result<void, Failure>> saveReceipt(
    ReceiptEntity receipt, {
    String? sheetId,
    String? sheetName,
  }) {
    return _repositoryData.saveReceipt(
      receipt,
      sheetId: sheetId,
      sheetName: sheetName,
    );
  }
}
