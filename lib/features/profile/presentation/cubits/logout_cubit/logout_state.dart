part of 'logout_cubit.dart';

class LogoutState {}

final class LogoutInitial extends LogoutState {}

final class LogoutLoading extends LogoutState {}

final class LogoutSuccess extends LogoutState {}

final class LogoutFailure extends LogoutState {
  final String msg;

  LogoutFailure({required this.msg});
}
