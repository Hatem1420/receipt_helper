import 'package:equatable/equatable.dart';
import 'package:googleapis/drive/v2.dart';
import 'package:googleapis/sheets/v4.dart';

abstract class UserSheetsState extends Equatable {
  const UserSheetsState();

  @override
  List<Object?> get props => [];
}

class UserSheetsInitialState extends UserSheetsState {}

class UserSheetsSuccessState extends UserSheetsState {
  final List<File> spreadSheets;
  final List<Sheet>? sheets;
  final String? sheetError;

  const UserSheetsSuccessState({required this.spreadSheets, this.sheets, this.sheetError});

  UserSheetsSuccessState copyWith({
    List<File>? spreadSheets,
    List<Sheet>? sheets,
    String? sheetError
  }) {
    return UserSheetsSuccessState(
      spreadSheets: spreadSheets ?? this.spreadSheets,
      sheets: sheets ?? this.sheets,
      sheetError: sheetError ?? this.sheetError
    );
  }

  @override
  List<Object?> get props => [spreadSheets, sheets, sheetError];
}

class UserSheetsErrorState extends UserSheetsState {
  final String message;
  const UserSheetsErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
