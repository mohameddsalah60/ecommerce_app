import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../domin/entites/notifications_entity.dart';

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
          colorFilter: ColorFilter.mode(
            notificationsEntity.getColorsStatus(notificationsEntity.message),
            BlendMode.srcIn,
          ),
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
