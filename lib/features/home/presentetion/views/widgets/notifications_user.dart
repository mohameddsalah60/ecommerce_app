import 'package:ecommerce_app/features/home/presentetion/views/notifications_user_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';

class NotificationsUser extends StatelessWidget {
  const NotificationsUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.of(context).pushNamed(NotificationsUserView.routeName),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white.withValues(alpha: .15)),
        child: Badge(
          backgroundColor: Colors.red,
          label: const Text(
            "3",
            style: AppTextStyles.regular13,
          ),
          child: SvgPicture.asset(
            Assets.imagesNotification,
            width: 26,
            height: 26,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
