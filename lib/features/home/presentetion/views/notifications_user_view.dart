import 'package:ecommerce_app/core/service/get_it_service.dart';
import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_skeletonizer_loading.dart';
import 'package:ecommerce_app/features/home/domin/entites/notifications_entity.dart';
import 'package:ecommerce_app/features/home/domin/repos/home_repo.dart';
import 'package:ecommerce_app/features/home/presentetion/cubits/notifications_cubit/notifications_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/notification_item.dart';

class NotificationsUserView extends StatelessWidget {
  const NotificationsUserView({super.key});
  static const String routeName = 'notifications';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'Notifications',
        onTap: () => Navigator.pop(context),
      ),
      body: BlocProvider(
        create: (context) =>
            NotificationsCubit(getIt<HomeRepo>())..getNotifications(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8,
          ),
          child: Column(
            children: [
              BlocBuilder<NotificationsCubit, NotificationsState>(
                builder: (context, state) {
                  if (state is NotificationsSuccess) {
                    return Expanded(
                        child: ListView.builder(
                      itemCount: state.notifications.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: NotificationItem(
                            notificationsEntity: state.notifications[index],
                          ),
                        );
                      },
                    ));
                  } else if (state is NotificationsFailure) {
                    return Expanded(
                        child: Text(
                      state.message,
                      style: AppTextStyles.bold19,
                    ));
                  } else {
                    return CustomSkeletonizerLoading(
                        isLoading: state is NotificationsLoading ? true : false,
                        child: const NotificationItemLoading());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationItemLoading extends StatelessWidget {
  const NotificationItemLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        6,
        (index) => Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: NotificationItem(
            notificationsEntity: NotificationsEntity(
                id: 0,
                title: 'title Loading..',
                message: "message Loading............"),
          ),
        ),
      ),
    );
  }
}
