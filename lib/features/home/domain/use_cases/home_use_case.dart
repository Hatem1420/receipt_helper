import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:receipt_helper/core/errors/failure.dart';
import 'package:receipt_helper/features/home/domain/entities/home_entity.dart';
import 'package:receipt_helper/features/home/domain/repositories/home_repository_domain.dart';


@lazySingleton
class HomeUseCase {
  final HomeRepositoryDomain _repositoryData;

  HomeUseCase(this._repositoryData);

   Future<Result<List<HomeEntity>, Failure>> getHome() async {
    return _repositoryData.getHome();
  }
}
