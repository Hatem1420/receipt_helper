import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:receipt_helper/core/common/entities/receipt_entity.dart';
import 'package:receipt_helper/core/errors/failure.dart';
import 'package:receipt_helper/features/scan/domain/repositories/scan_repository_domain.dart';

@lazySingleton
class ScanUseCase {
  final ScanRepositoryDomain _repositoryData;

  ScanUseCase(this._repositoryData);

  Future<Result<ReceiptEntity, Failure>> getScan(String imagePath) async {
    return _repositoryData.getScan(imagePath);
  }

  Future<Result<void, Failure>> saveReceipt(ReceiptEntity receipt) {
    return _repositoryData.saveReceipt(receipt);
  }
}
