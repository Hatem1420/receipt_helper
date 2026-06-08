import 'package:multiple_result/multiple_result.dart';
import 'package:receipt_helper/core/errors/failure.dart';
import 'package:receipt_helper/features/scan/domain/entities/scan_entity.dart';

abstract class ScanRepositoryDomain {
    Future<Result<ScanEntity, Failure>> getScan();
}
