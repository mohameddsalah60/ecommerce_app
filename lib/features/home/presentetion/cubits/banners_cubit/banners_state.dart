part of 'banners_cubit.dart';

class BannersState {}

final class BannersInitial extends BannersState {}

final class BannersLoading extends BannersState {}

final class BannersSuccsess extends BannersState {
  final List<BannersEntity> banners;

  BannersSuccsess({required this.banners});
}

final class BannersFailure extends BannersState {
  final String message;

  BannersFailure({required this.message});
}
