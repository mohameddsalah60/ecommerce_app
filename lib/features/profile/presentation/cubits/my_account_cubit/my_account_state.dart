part of 'my_account_cubit.dart';

class MyAccountState {}

final class MyAccountInitial extends MyAccountState {}

final class MyAccountLoading extends MyAccountState {}

final class MyAccountSuccess extends MyAccountState {}

final class MyAccountFailure extends MyAccountState {
  final String message;

  MyAccountFailure({required this.message});
}
