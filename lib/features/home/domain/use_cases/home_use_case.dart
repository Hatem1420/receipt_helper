import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:receipt_helper/core/common/entities/receipt_entity.dart';
import 'package:receipt_helper/core/errors/failure.dart';
import 'package:receipt_helper/features/home/domain/repositories/home_repository_domain.dart';


@lazySingleton
class HomeUseCase {
  final HomeRepositoryDomain _repositoryData;

  HomeUseCase(this._repositoryData);

   Stream<Result<List<ReceiptEntity>, Failure>> getHome() {
    return _repositoryData.getHome();
  }
}
