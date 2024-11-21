part of 'sign_in_cubit.dart';

class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccsess extends SignInState {
  final UserEntity userEntite;

  SignInSuccsess({required this.userEntite});
}

final class SignInFailure extends SignInState {
  final String errorMessages;

  SignInFailure({required this.errorMessages});
}
