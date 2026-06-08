import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:receipt_helper/core/common/entities/receipt_entity.dart';
import 'package:receipt_helper/core/common/models/receipt_model/receipt_model.dart';
import 'package:receipt_helper/core/errors/network_exceptions.dart';
import 'package:receipt_helper/core/errors/failure.dart';
import 'package:receipt_helper/features/home/data/datasources/home_local_data_source.dart';
import 'package:receipt_helper/features/home/domain/repositories/home_repository_domain.dart';

@LazySingleton(as: HomeRepositoryDomain)
class HomeRepositoryData implements HomeRepositoryDomain {
  final BaseHomeLocalDataSource localDataSource;

  HomeRepositoryData(this.localDataSource);

  @override
  Stream<Result<List<ReceiptEntity>, Failure>> getHome() {
    return localDataSource
        .getHome()
        .map<Result<List<ReceiptEntity>, Failure>>((event) {
          final receipts = event?.map((e) => e.toEntity()).toList() ?? [];
          return Success(receipts);
        })
        .handleError((error) => Error(FailureExceptions.getException(error)));
  }
}
