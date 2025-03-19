import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';

class OrderStoreLogo extends StatelessWidget {
  const OrderStoreLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(
        Assets.imagesAppLogo,
        height: MediaQuery.sizeOf(context).height * .07,
        width: MediaQuery.sizeOf(context).width * .15,
      ),
    );
  }
}
