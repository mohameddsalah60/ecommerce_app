import 'package:flutter/material.dart';

import 'checkout_address.dart';
import 'checkout_selected_payment.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CheckoutSelectedAddress(),
            SizedBox(
              height: 16,
            ),
            CheckoutSelectedPayment(),
          ],
        ),
      ),
    );
  }
}
