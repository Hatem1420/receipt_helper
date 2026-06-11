import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_helper/features/sub/user_sheets/domain/use_cases/user_sheets_use_case.dart';
import 'package:receipt_helper/features/sub/user_sheets/presentation/cubit/user_sheets_state.dart';

class UserSheetsCubit extends Cubit<UserSheetsState> {
  final UserSheetsUseCase _userSheetsUseCase;

  UserSheetsCubit(this._userSheetsUseCase) : super(UserSheetsInitialState()) {
    getUserSheetsMethod();
  }

  Future<void> getUserSheetsMethod() async {
    final result = await _userSheetsUseCase.getUserSheets();
    result.when(
      (success) {
        emit(UserSheetsSuccessState(spreadSheets: success));
      },
      (whenError) {
        emit(UserSheetsErrorState(message: whenError.message));
      },
    );
  }

  Future<void> fetchTabs(String spreadsheetId) async {
    print('----------------0 $spreadsheetId');
    final result = await _userSheetsUseCase.fetchTabs(spreadsheetId);
    result.when(
      (success) {
        if (state is UserSheetsSuccessState) {
          emit((state as UserSheetsSuccessState).copyWith(sheets: success));
        }
      },
      (whenError) {
        if (state is UserSheetsSuccessState) {
          final spreadsheets = (state as UserSheetsSuccessState).spreadSheets;
          emit(
            UserSheetsSuccessState(
              spreadSheets: spreadsheets,
              sheetError: whenError.message,
            ),
          );
        }
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
