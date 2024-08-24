import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an Account? ',
          style: AppTextStyles.semiBold16.copyWith(
            color: const Color(0xff949D9E),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Log In',
            style: AppTextStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
