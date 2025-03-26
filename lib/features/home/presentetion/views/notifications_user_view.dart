import 'package:ecommerce_app/core/service/get_it_service.dart';
import 'package:ecommerce_app/core/utils/app_images.dart';
import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_text_and_loading.dart';
import 'package:ecommerce_app/features/home/domin/entites/notifications_entity.dart';
import 'package:ecommerce_app/features/home/domin/repos/home_repo.dart';
import 'package:ecommerce_app/features/home/presentetion/cubits/notifications_cubit/notifications_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                    return const CustomTextAndLoading();
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

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.notificationsEntity,
  });
  final NotificationsEntity notificationsEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.black26,
          width: 1,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: SvgPicture.asset(
          Assets.imagesNotification,
        ),
        title: Text(
          notificationsEntity.title,
          style: AppTextStyles.bold16,
        ),
        subtitle: Text(
          notificationsEntity.message,
          style: AppTextStyles.semiBold16.copyWith(
              color: notificationsEntity
                  .getColorsStatus(notificationsEntity.message)),
        ),
      ),
    );
  }
}
