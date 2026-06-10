import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:receipt_helper/core/errors/failure.dart';
import 'package:receipt_helper/features/loading/domain/repositories/loading_repository_domain.dart';


@lazySingleton
class LoadingUseCase {
  final LoadingRepositoryDomain _repositoryData;

  LoadingUseCase(this._repositoryData);

   Future<Result<void, Failure>> getLoading() async {
    return _repositoryData.getLoading();
  }
}
