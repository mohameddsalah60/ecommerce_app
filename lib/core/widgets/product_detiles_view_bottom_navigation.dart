import 'package:flutter/material.dart';

import 'custom_button.dart';

class ProductDetilesbottomNavigation extends StatelessWidget {
  const ProductDetilesbottomNavigation({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .10,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 10,
            color: Colors.black38,
            spreadRadius: 0,
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CustomButton(
                text: 'Add to cart',
                radius: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
