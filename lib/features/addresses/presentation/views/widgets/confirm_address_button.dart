import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class ConfirmAddressButton extends StatelessWidget {
  const ConfirmAddressButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .15,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: const Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
            leading: Icon(
              Icons.location_on_rounded,
              size: 32,
              color: AppColors.primaryColor,
            ),
            title: Text(
              'القاهرة , شارع سعد زغلول',
              style: AppTextStyles.bold16,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 48),
            child: CustomButton(
              text: "Confirm pin location",
              radius: 24,
            ),
          ),
        ],
      ),
    );
  }
}
