import 'dart:developer';

import 'package:googleapis/drive/v2.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:injectable/injectable.dart';
import 'package:googleapis_auth/googleapis_auth.dart' as gapis;

@singleton
class GoogleApiService {
  Future<void> appendRow({
    required gapis.AuthClient client,
    String? spreadsheetId,
    String? sheetName,
    required List<Object?> values,
  }) async {
    final api = SheetsApi(client);
    String? sheetId = spreadsheetId;
    String? sName = sheetName;

    if (sheetId == null) {
      final newSheet = await api.spreadsheets.create(Spreadsheet());
      sheetId = newSheet.spreadsheetId;
      sName = newSheet.sheets!.first.properties!.title;
    }

    final response = await api.spreadsheets.values.append(
      ValueRange(values: [values]),
      sheetId!,
      sName!, // tab name
      valueInputOption: 'USER_ENTERED', // parse dates + numbers
      insertDataOption: 'INSERT_ROWS',
    );
    log(response.updates.toString());
  }

  Future<List<File>?> getUserSheets({required gapis.AuthClient client}) async {
    final driveApi = DriveApi(client);
    final spreadsheets = await driveApi.files.list(
      q: "mimeType='application/vnd.google-apps.spreadsheet' and trashed=false",
      maxResults: 50,
      $fields: 'items(id,title,modifiedDate)',
    );
    return spreadsheets.items;
  }

  Future<List<Sheet>?> fetchTabs({
    required String spreadsheetId,
    required gapis.AuthClient client,
  }) async {
    final api = SheetsApi(client);

    final spreadsheet = await api.spreadsheets.get(
      spreadsheetId,
      includeGridData: false,
    );
    return spreadsheet.sheets;
  }
}
