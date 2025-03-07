part of 'pin_location_cubit.dart';

class PinLocationState {}

final class PinLocationInitial extends PinLocationState {}

final class PinLocationLoading extends PinLocationState {}

final class PinLocationSuccsess extends PinLocationState {
  final LatLng letLong;

  PinLocationSuccsess({required this.letLong});
}

final class PinLocationFailure extends PinLocationState {
  final String message;

  PinLocationFailure({required this.message});
}

final class GetAddressformLocation extends PinLocationState {
  final AddressEntity addressEntity;

  GetAddressformLocation({required this.addressEntity});
}
