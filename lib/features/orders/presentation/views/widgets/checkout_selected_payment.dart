import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:ecommerce_app/features/orders/domin/entites/payment_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'checkout_border_widgets.dart';

class CheckoutSelectedPayment extends StatefulWidget {
  const CheckoutSelectedPayment({
    super.key,
  });

  @override
  State<CheckoutSelectedPayment> createState() =>
      _CheckoutSelectedPaymentState();
}

class _CheckoutSelectedPaymentState extends State<CheckoutSelectedPayment> {
  int? _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return CheckoutBorderWidgets(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Pay with",
            style: AppTextStyles.bold16,
          ),
          Column(
            children: List.generate(
              listOfPay.length,
              (index) {
                return ListTile(
                  leading: SvgPicture.asset(
                    listOfPay[index].icon,
                    width: 40,
                    height: 40,
                  ),
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(listOfPay[index].title),
                  trailing: Radio<int>(
                    value: listOfPay[index].value,
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
