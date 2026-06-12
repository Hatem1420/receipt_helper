import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:receipt_helper/core/common/entities/receipt_entity.dart';
import 'package:receipt_helper/core/common/models/receipt_model/receipt_model.dart';
import 'package:receipt_helper/core/errors/network_exceptions.dart';
import 'package:receipt_helper/core/errors/failure.dart';

import 'package:receipt_helper/features/sub/receipt_review/data/datasources/receipt_review_remote_data_source.dart';
import 'package:receipt_helper/features/sub/receipt_review/domain/repositories/receipt_review_repository_domain.dart';

@LazySingleton(as: ReceiptReviewRepositoryDomain)
class ReceiptReviewRepositoryData implements ReceiptReviewRepositoryDomain {
  final BaseReceiptReviewRemoteDataSource remoteDataSource;

  ReceiptReviewRepositoryData(this.remoteDataSource);

  @override
  Future<Result<void, Failure>> saveReceipt(
    ReceiptEntity receipt, {
    String? sheetId,
    String? sheetName,
  }) async {
    try {
      await remoteDataSource.saveReceipt(
        ReceiptModel.fromEntity(receipt),
        sheetId: sheetId,
        sheetName: sheetName,
      );
      return Success(null);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
