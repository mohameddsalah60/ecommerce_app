part of 'get_current_location_cubit.dart';

class GetCurrentLocationState {}

final class GetCurrentLocationInitial extends GetCurrentLocationState {}

final class GetCurrentLocationLoading extends GetCurrentLocationState {}

final class GetCurrentLocationSuccsess extends GetCurrentLocationState {
  final LatLng letLong;

  GetCurrentLocationSuccsess({required this.letLong});
}

final class GetCurrentLocationFailure extends GetCurrentLocationState {
  final String message;

  GetCurrentLocationFailure({required this.message});
}
