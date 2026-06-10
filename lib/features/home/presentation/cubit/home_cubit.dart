import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_helper/core/common/entities/receipt_entity.dart';
import 'package:receipt_helper/features/home/domain/use_cases/home_use_case.dart';
import 'package:receipt_helper/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase _homeUseCase;

  HomeCubit(this._homeUseCase) : super(HomeInitialState()) {
    getHomeMethod();
  }

  Future<void> getHomeMethod() async {
    _homeUseCase.getHome().listen((event) async {
      await event.when(
        (success) {
          final updatedReceipts = List.of(success);
          if (state is HomeSuccessState) {
            final oldState = state;
            final newState = HomeSuccessState(
              receipts: updatedReceipts,
              emittedAt: DateTime.now(),
            );
            print(oldState == newState);
            print(identical(oldState, newState));
          }

          emit(
            HomeSuccessState(
              receipts: updatedReceipts,
              emittedAt: DateTime.now(),
            ),
          );
        },
        (whenError) {
          emit(HomeErrorState(message: whenError.message));
        },
      );
    });
  }

  void removeReceipt(List<ReceiptEntity> newList) {}

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
