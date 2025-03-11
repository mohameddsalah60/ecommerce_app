part of 'address_actions_cubit.dart';

sealed class AddressActionsState {}

final class AddNewAddressInitial extends AddressActionsState {}

final class AddressActionsLoading extends AddressActionsState {}

final class AddNewAddressSuccsess extends AddressActionsState {}

final class UpdateAddressSuccsess extends AddressActionsState {}

final class DeleteAddressSuccsess extends AddressActionsState {}

final class AddressActionsFailure extends AddressActionsState {
  final String message;

  AddressActionsFailure({required this.message});
}
