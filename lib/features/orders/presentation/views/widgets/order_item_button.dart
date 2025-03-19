import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class OrderItemButton extends StatelessWidget {
  const OrderItemButton({
    super.key,
    required this.status,
  });
  final String status;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .30,
      child: CustomButton(
        text: status == 'New' || status == 'جديد'
            ? 'Cancel Order'
            : 'Order agien',
        backgroundColor: Colors.white,
        radius: 32,
      ),
    );
  }
}
