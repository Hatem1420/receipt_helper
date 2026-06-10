import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:receipt_helper/core/errors/failure.dart';
import 'package:receipt_helper/features/auth/domain/repositories/auth_repository_domain.dart';


@lazySingleton
class AuthUseCase {
  final AuthRepositoryDomain _repositoryData;

  AuthUseCase(this._repositoryData);

   Future<Result<void, Failure>> getAuth() async {
    return _repositoryData.getAuth();
  }
}
