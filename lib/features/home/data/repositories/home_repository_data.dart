
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:receipt_helper/core/errors/network_exceptions.dart';
import 'package:receipt_helper/core/errors/failure.dart';
import 'package:receipt_helper/features/home/data/datasources/home_local_data_source.dart';
import 'package:receipt_helper/features/home/domain/entities/home_entity.dart';
import 'package:receipt_helper/features/home/data/models/home_model.dart';
import 'package:receipt_helper/features/home/domain/repositories/home_repository_domain.dart';

@LazySingleton(as: HomeRepositoryDomain)
class HomeRepositoryData implements HomeRepositoryDomain{
  final BaseHomeLocalDataSource localDataSource;


  HomeRepositoryData(this.localDataSource);

@override
  Future<Result<List<HomeEntity>, Failure>> getHome() async {
    try {
      final response = await localDataSource.getHome();
      return Success(response.map((e) => e.toEntity(),).toList());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
