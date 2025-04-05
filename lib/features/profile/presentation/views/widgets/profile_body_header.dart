import 'package:flutter/material.dart';

import '../../../../../core/helper_functions/get_user.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 16,
        ),
        Image.asset(
          Assets.imagesMan,
          height: 150,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getUser().name,
              style: AppTextStyles.bold16,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          getUser().email,
          style: AppTextStyles.bold16.copyWith(color: const Color(0xff888FA0)),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
