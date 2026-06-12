import 'package:multiple_result/multiple_result.dart';
import 'package:receipt_helper/core/common/entities/receipt_entity.dart';
import 'package:receipt_helper/core/errors/failure.dart';

abstract class ReceiptReviewRepositoryDomain {
  Future<Result<void, Failure>> saveReceipt(
    ReceiptEntity receipt, {
    String? sheetId,
    String? sheetName,
  });
}
