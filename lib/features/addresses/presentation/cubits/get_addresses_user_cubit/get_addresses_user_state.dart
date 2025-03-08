part of 'get_addresses_user_cubit.dart';

sealed class GetAddressesUserState {}

final class GetAddressesUserInitial extends GetAddressesUserState {}

final class GetAddressesUserLoading extends GetAddressesUserState {}

final class GetAddressesUserSuccsess extends GetAddressesUserState {
  final List<AddressEntity> addresses;

  GetAddressesUserSuccsess({required this.addresses});
}

final class GetAddressesUserFailure extends GetAddressesUserState {
  final String message;

  GetAddressesUserFailure({required this.message});
}
