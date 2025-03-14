import 'package:flutter/material.dart';

import '../../../../../core/helper_functions/get_addresses_user.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../addresses/presentation/views/select_delivery_address_view.dart';
import '../../../../home/presentetion/views/widgets/address_user_home_view.dart';

class CheckoutSelectedAddress extends StatefulWidget {
  const CheckoutSelectedAddress({
    super.key,
  });

  @override
  State<CheckoutSelectedAddress> createState() =>
      _CheckoutSelectedAddressState();
}

class _CheckoutSelectedAddressState extends State<CheckoutSelectedAddress> {
  updateAddress() {
    setState(() {
      getAddresses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black26,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            size: 22,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getAddresses().nameAddress,
                  style: AppTextStyles.bold16,
                ),
                Text(
                  "${getAddresses().city},${getAddresses().region},${getAddresses().details}",
                  style: AppTextStyles.regular13,
                ),
                Text(
                  "Mobile Number : ${getAddresses().notes}",
                  style: AppTextStyles.regular13,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          GestureDetector(
            onTap: () {
              selectDeliveryAddress(context, addressNotifier).whenComplete(
                () {
                  updateAddress();
                },
              );
            },
            child: Text(
              "Change",
              style: AppTextStyles.regular13.copyWith(
                decoration: TextDecoration.underline,
                color: Colors.blue.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
