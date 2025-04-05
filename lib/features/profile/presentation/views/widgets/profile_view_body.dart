import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:ecommerce_app/features/orders/presentation/views/orders_items_view.dart';
import 'package:ecommerce_app/features/profile/domin/profile_item_entity.dart';
import 'package:ecommerce_app/features/profile/presentation/views/my_account_view.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_images.dart';
import 'logout_view.dart';
import 'profile_body_header.dart';
import 'profile_item.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileHeader(),
            const SizedBox(
              height: 32,
            ),
            Column(
              children: List.generate(
                items.length,
                (index) => ProfileItem(
                  img: items[index].img,
                  text: items[index].text,
                  onTap: () {
                    if (index == 0) {
                      Navigator.pushNamed(context, MyAccountView.routeName);
                    } else if (index == 1) {
                      Navigator.pushNamed(context, OrdersItemsView.routeName);
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Help',
              style: AppTextStyles.bold16,
            ),
            const SizedBox(
              height: 16,
            ),
            const ProfileItem(img: Assets.imagesInfoCircle, text: 'About us'),
            const SizedBox(
              height: 24,
            ),
            ProfileItem(
              img: Assets.imagesLogout,
              text: 'Logout',
              color: AppColors.primaryColor,
              onTap: () {
                showLogoutConfirmationDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
