import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(13, 0),
      child: Row(
        children: [
          Expanded(
            child: Text.rich(
              TextSpan(
                text: 'By signing up you agree to our ',
                style: AppTextStyles.semiBold16.copyWith(
                  color: const Color(0xff949D9E),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Terms & Conditions and Privacy Policy',
                    style: AppTextStyles.semiBold16.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
