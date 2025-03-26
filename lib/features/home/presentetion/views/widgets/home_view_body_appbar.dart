import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'address_user_home_view.dart';
import 'notifications_user.dart';

class HomeViewBodyAppBar extends StatelessWidget {
  const HomeViewBodyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery Address,',
              textAlign: TextAlign.start,
              style: AppTextStyles.regular13.copyWith(color: Colors.white),
            ),
            const AddressUserHomeView(),
          ],
        ),
        const NotificationsUser(),
      ],
    );
  }
}
