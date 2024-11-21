part of 'sign_up_cubit.dart';

class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccsess extends SignUpState {
  final UserEntity userEntite;

  SignUpSuccsess({required this.userEntite});
}

final class SignUpFailure extends SignUpState {
  final String errorMessages;

  SignUpFailure({required this.errorMessages});
}
