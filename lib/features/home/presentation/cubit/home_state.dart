import 'package:equatable/equatable.dart';
import 'package:receipt_helper/features/home/domain/entities/home_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<HomeEntity> receipts;

  const HomeSuccessState({required this.receipts});

  @override
  List<Object?> get props => [receipts];
}

class HomeErrorState extends HomeState {
  final String message;
  const HomeErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
