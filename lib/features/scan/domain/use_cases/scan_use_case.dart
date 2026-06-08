import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:receipt_helper/core/errors/failure.dart';
import 'package:receipt_helper/features/scan/domain/entities/scan_entity.dart';
import 'package:receipt_helper/features/scan/domain/repositories/scan_repository_domain.dart';


@lazySingleton
class ScanUseCase {
  final ScanRepositoryDomain _repositoryData;

  ScanUseCase(this._repositoryData);

   Future<Result<ScanEntity, Failure>> getScan() async {
    return _repositoryData.getScan();
  }
}
