import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class OrderItemButton extends StatelessWidget {
  const OrderItemButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .30,
      child: const CustomButton(
        text: 'Cancel Order',
        backgroundColor: Colors.white,
        radius: 32,
      ),
    );
  }
}
