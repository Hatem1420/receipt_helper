import 'package:multiple_result/multiple_result.dart';
import 'package:receipt_helper/core/errors/failure.dart';
import 'package:receipt_helper/features/loading/domain/entities/loading_entity.dart';

abstract class LoadingRepositoryDomain {
    Future<Result<LoadingEntity, Failure>> getLoading();
}
