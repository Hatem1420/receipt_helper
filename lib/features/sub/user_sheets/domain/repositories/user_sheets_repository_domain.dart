import 'package:googleapis/drive/v2.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:receipt_helper/core/errors/failure.dart';

abstract class UserSheetsRepositoryDomain {
  Future<Result<List<File>, Failure>> getUserSheets();
  Future<Result<List<Sheet>, Failure>> fetchTabs(String spreadsheetId);
}
