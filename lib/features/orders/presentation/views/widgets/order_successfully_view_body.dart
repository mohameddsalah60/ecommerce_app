import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class OrderSuccessfullyViewBody extends StatelessWidget {
  const OrderSuccessfullyViewBody({
    super.key,
    required this.orderId,
  });

  final int orderId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          SvgPicture.asset(Assets.imagesSuccessfully),
          const SizedBox(
            height: 48,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Order #$orderId Successful',
              style: AppTextStyles.bold19,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Thank you for your order!',
            style: AppTextStyles.semiBold16,
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 48.0),
            child: Text(
              'A Notification will be sent when your order in on the way!',
              style: AppTextStyles.semiBold16,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
          const Spacer(),
          const CustomButton(text: 'Cancel Order'),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
