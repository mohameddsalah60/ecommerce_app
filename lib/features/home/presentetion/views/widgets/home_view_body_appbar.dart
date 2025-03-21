import 'package:ecommerce_app/core/utils/app_images.dart';
import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'address_user_home_view.dart';

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
        Stack(
          clipBehavior: Clip.none,
          children: [
            SvgPicture.asset(
              Assets.imagesNotification,
              width: 26,
              height: 26,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            Positioned(
              right: 0,
              top: -4,
              child: Container(
                height: 16,
                width: 16,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red,
                ),
                child: Text(
                  "2",
                  style: AppTextStyles.regular13.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
