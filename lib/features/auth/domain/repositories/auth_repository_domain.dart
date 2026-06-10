import 'package:multiple_result/multiple_result.dart';
import 'package:receipt_helper/core/errors/failure.dart';

abstract class AuthRepositoryDomain {
    Future<Result<void, Failure>> getAuth();
}
