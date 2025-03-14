import 'package:ecommerce_app/features/orders/domin/entites/payment_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black26,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
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
    );
  }
}
