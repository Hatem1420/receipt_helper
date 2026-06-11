import 'package:googleapis/drive/v2.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:receipt_helper/core/errors/failure.dart';
import 'package:receipt_helper/features/sub/user_sheets/domain/repositories/user_sheets_repository_domain.dart';

@lazySingleton
class UserSheetsUseCase {
  final UserSheetsRepositoryDomain _repositoryData;

  UserSheetsUseCase(this._repositoryData);

  Future<Result<List<File>, Failure>> getUserSheets() async {
    return _repositoryData.getUserSheets();
  }

  Future<Result<List<Sheet>, Failure>> fetchTabs(String spreadsheetId) async {
    return _repositoryData.fetchTabs(spreadsheetId);
  }
}
