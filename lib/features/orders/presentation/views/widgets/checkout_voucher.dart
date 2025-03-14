import 'package:ecommerce_app/core/helper_functions/custom_snack_bar.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'checkout_border_widgets.dart';
import 'enter_code_voucer_field.dart';
import 'you_have_voucer_code.dart';

class CheckoutVoucher extends StatelessWidget {
  const CheckoutVoucher({super.key});
  @override
  Widget build(BuildContext context) {
    return CheckoutBorderWidgets(
      child: Column(
        children: [
          const YouHaveVoucherCode(),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const EnterCodeVoucherField(),
              GestureDetector(
                onTap: () {
                  customSnackBar(context,
                      text:
                          'This voucher code is invalid, please enter a valid code');
                },
                child: Text(
                  'Sumbit',
                  style: AppTextStyles.semiBold16
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
