
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:receipt_helper/core/errors/network_exceptions.dart';
import 'package:receipt_helper/core/errors/failure.dart';
import 'package:receipt_helper/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:receipt_helper/features/auth/domain/repositories/auth_repository_domain.dart';

@LazySingleton(as: AuthRepositoryDomain)
class AuthRepositoryData implements AuthRepositoryDomain{
  final BaseAuthRemoteDataSource remoteDataSource;


  AuthRepositoryData(this.remoteDataSource);

@override
  Future<Result<void, Failure>> getAuth() async {
    try {
      await remoteDataSource.getAuth();
      return Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
