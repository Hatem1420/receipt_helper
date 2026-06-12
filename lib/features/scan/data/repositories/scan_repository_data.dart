import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:receipt_helper/core/common/entities/receipt_entity.dart';
import 'package:receipt_helper/core/common/models/receipt_model/receipt_model.dart';
import 'package:receipt_helper/core/errors/network_exceptions.dart';
import 'package:receipt_helper/core/errors/failure.dart';

import 'package:receipt_helper/features/scan/data/datasources/scan_remote_data_source.dart';
import 'package:receipt_helper/features/scan/domain/repositories/scan_repository_domain.dart';

@LazySingleton(as: ScanRepositoryDomain)
class ScanRepositoryData implements ScanRepositoryDomain {
  final BaseScanRemoteDataSource remoteDataSource;

  ScanRepositoryData(this.remoteDataSource);

  @override
  Future<Result<ReceiptEntity, Failure>> getScan(String imagePath) async {
    try {
      final response = await remoteDataSource.getScan(imagePath);
      return Success(response.toEntity());
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
