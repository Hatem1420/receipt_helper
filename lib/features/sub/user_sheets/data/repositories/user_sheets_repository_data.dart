import 'package:googleapis/drive/v2.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:receipt_helper/core/errors/network_exceptions.dart';
import 'package:receipt_helper/core/errors/failure.dart';

import 'package:receipt_helper/features/sub/user_sheets/data/datasources/user_sheets_remote_data_source.dart';
import 'package:receipt_helper/features/sub/user_sheets/domain/repositories/user_sheets_repository_domain.dart';

@LazySingleton(as: UserSheetsRepositoryDomain)
class UserSheetsRepositoryData implements UserSheetsRepositoryDomain {
  final BaseUserSheetsRemoteDataSource remoteDataSource;

  UserSheetsRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<File>, Failure>> getUserSheets() async {
    try {
      final response = await remoteDataSource.getUserSheets();
      return Success(response);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<List<Sheet>, Failure>>  fetchTabs(String spreadsheetId) async {
    try {
      final response = await remoteDataSource.fetchTabs(spreadsheetId);
      return Success(response);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
