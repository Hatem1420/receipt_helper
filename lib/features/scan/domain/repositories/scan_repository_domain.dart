import 'package:multiple_result/multiple_result.dart';
import 'package:receipt_helper/core/common/entities/receipt_entity.dart';
import 'package:receipt_helper/core/errors/failure.dart';

abstract class ScanRepositoryDomain {
    Future<Result<ReceiptEntity, Failure>> getScan(String imagePath);
    Future<Result<void, Failure>> saveReceipt(ReceiptEntity receipt);
}
