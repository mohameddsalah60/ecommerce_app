import 'dart:async';
import 'package:ecommerce_app/features/home/domin/entites/notifications_entity.dart';
import 'package:ecommerce_app/features/home/domin/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this.homeRepo) : super(NotificationsInitial());

  final HomeRepo homeRepo;

  int newNotificationsLength = 0;

  Future<void> getNotifications() async {
    emit(NotificationsLoading());

    var result = await homeRepo.getNotifications();
    result.fold(
        (failure) => emit(NotificationsFailure(message: failure.errorMessage)),
        (notifications) {
      emit(NotificationsSuccess(notifications: notifications));
    });
  }
}
