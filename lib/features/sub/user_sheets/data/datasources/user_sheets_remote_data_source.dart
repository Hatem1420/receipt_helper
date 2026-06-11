import 'package:googleapis/drive/v2.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:injectable/injectable.dart';
import 'package:receipt_helper/core/services/google_api_service.dart';
import 'package:receipt_helper/core/services/user_service.dart';

abstract class BaseUserSheetsRemoteDataSource {
  Future<List<File>> getUserSheets();
  Future<List<Sheet>> fetchTabs(String spreadsheetId);
}

@LazySingleton(as: BaseUserSheetsRemoteDataSource)
class UserSheetsRemoteDataSource implements BaseUserSheetsRemoteDataSource {
  final UserService _userService;
  final GoogleApiService _googleApiService;

  UserSheetsRemoteDataSource(this._userService, this._googleApiService);

  @override
  Future<List<File>> getUserSheets() async {
    if (_userService.currentSpreadsheets != null) {
      return _userService.currentSpreadsheets!;
    }
    final response = await _googleApiService.getUserSheets(
      client: _userService.currentClient!,
    );

    if (response == null) throw Exception('No Sheets found!');
    _userService.registerSpreadsheets = response;
    return response;
  }

  @override
  Future<List<Sheet>> fetchTabs(String spreadsheetId) async {
    final sheets = await _googleApiService.fetchTabs(
      spreadsheetId: spreadsheetId,
      client: _userService.currentClient!,
    );

    if (sheets == null) throw Exception('No sheets found');

    return sheets.where((s) => s.properties?.sheetType == 'GRID').toList();
  }
}
