part of 'add_new_address_cubit.dart';

sealed class AddNewAddressState {}

final class AddNewAddressInitial extends AddNewAddressState {}

final class AddNewAddressLoading extends AddNewAddressState {}

final class AddNewAddressSuccsess extends AddNewAddressState {}

final class AddNewAddressFailure extends AddNewAddressState {
  final String message;

  AddNewAddressFailure({required this.message});
}
